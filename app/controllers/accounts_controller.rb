class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user, only: [:save_debit]
  before_action :get_account, only: [:index, :enquiry]

  # GET /accounts
  # GET /accounts.json
  def index
    
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/credit
  def credit
    @account = Account.new
  end

  # GET /accounts/debit
  def debit
    @account = Account.new
    @account.user_id = current_user.id
  end

  # GET /accounts/1/edit
  def edit
  end

  def save_credit
     @account = Account.new(account_params)
     @account.user_id = current_user.id
    respond_to do |format|
      if @account.save
        
        format.html { redirect_to @account, notice: 'Amount is credited to your account.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :credit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def save_debit
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Amount is debited from your account.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :debit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def enquiry
    @balance = @accounts.sum(:credit) - @accounts.sum(:debit)
  end
  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    def get_account
      @accounts = Account.where(user_id: current_user.id)
    end

    def set_current_user
      Account.current = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:credit, :debit, :user_id)
    end
end

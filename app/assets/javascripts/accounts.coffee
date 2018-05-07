# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  dateFormat = 'mm/dd/yy'
  from = $('.datepicker1').datepicker(
    defaultDate: '+1w'
    changeMonth: true).on('change', ->
    to.datepicker 'option', 'minDate', getDate(this)
    return
  )
  to = $('.datepicker2').datepicker(
    defaultDate: '+1w'
    changeMonth: true).on('change', ->
    from.datepicker 'option', 'maxDate', getDate(this)
    return
  )

  getDate = (element) ->
    date = undefined
    try
      date = $.datepicker.parseDate(dateFormat, element.value)
    catch error
      date = null
    date

  return
`import Ember from 'ember'`

# import numeral from the global namespace
{ numeral } = window

# component that creates a gauge chart
GaugeChartComponent = Ember.Component.extend({

  # initialize variables to be used by the component
  label: null
  minValue: 0
  maxValue: 100
  value: 0

  # returns the default configuration for the highchart
  # see: http://api.highcharts.com/highcharts
  chartOptions: ->
    {
      chart:
        type: 'solidgauge'
      title: @get('label')
      pane:
        background:
          innerRadius: '60%'
          outerRadius: '100%'
          shape: 'arc'
      tooltip:
        enabled: false
      yAxis:
        min: parseInt(@get('minValue'), 10)
        max: parseInt(@get('maxValue'), 10)
        stops: [
          [0.1, '#DF5353'] # red
          [0.5, '#DDDF0D'] # yellow
          [0.9, '#55BF3B'] # green
        ]
        lineWidth: 0
        minorTickInterval: null
        startOnTick: true
        tickPixelInterval: 400
        tickWidth: 0
      plotOptions:
        solidgauge:
          dataLabels:
            y: 5
            borderWidth: 0
            useHTML: true
      series: []
      credits:
        enabled: false
    }

  # data point for the chart
  seriesData: ->
    {
      name: @get('label')
      data: [parseInt(@get('value'), 10)] # parses value to int base-10
      dataLabels:
        format: '<div style="text-align:center"><span style="font-size:25px;color:#000;">{y}</span></div><span style="font-size:12px;color:silver">Goal: ' + numeral(@get('maxValue')).format('0,0') + '</span>'
    }

  # trigger called by ember that is fired when the component is inserted into the page, not yet rendered
  # schedules the afterRender event in Ember's afterRender queue to render
  didInsertElement: ->
    @_super.apply(@, arguments)
    Ember.run.scheduleOnce('afterRender', @, @afterRenderEvent)
    return

  # renders the high chart on the page
  afterRenderEvent: ->
    @highChart = @$().highcharts(@chartOptions()).highcharts()
    @valueObserver()
    return

  # observes changes in the value property and updates the high chart series
  valueObserver: (->
    return unless @highChart?
    series = @highChart.series[0] # get first series in the chart

    # if the series exists, update it with the new value, if not, add it
    if series
      series.update(@seriesData())
    else
      @highChart.addSeries(@seriesData())

    return
  ).observes('value')
})

`export default GaugeChartComponent`

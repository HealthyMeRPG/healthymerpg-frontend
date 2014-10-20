`import Ember from 'ember'`

# import numeral from the global namespace
{ numeral } = window

GaugeChartComponent = Ember.Component.extend({
  label: null
  minValue: 0
  maxValue: 100

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

  seriesData: ->
    {
      name: @get('label')
      data: [parseInt(@get('value'), 10)]
      dataLabels:
        format: '<div style="text-align:center"><span style="font-size:25px;color:#000;">{y}{</div><span style="font-size:12px;color:silver">Goal: ' + numeral(@get('maxValue')).format('0,0') + '</span>'
    }

  didInsertElement: ->
    @_super.apply(@, arguments)
    Ember.run.scheduleOnce('afterRender', @, @afterRenderEvent)
    return

  afterRenderEvent: ->
    @highChart = @$().highcharts(@chartOptions()).highcharts()
    @valueObserver()
    return

  valueObserver: (->
    return unless @highChart?

    console.debug @highChart
    series = @highChart.series[0]

    console.debug 'value has changed: ', @get('value')
    console.debug @highChart.options.chart
    console.debug @seriesData()

    if series
      series.update(@seriesData())
    else
      @highChart.addSeries(@seriesData())

    return
  ).observes('value')
})

`export default GaugeChartComponent`

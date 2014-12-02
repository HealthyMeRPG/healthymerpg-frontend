`import Ember from 'ember'`

# component that creates a bar chart
LineChartComponent = Ember.Component.extend({

  # initialize variables to be used by the component
  title: null
  seriesName: null
  values: []
  nameProperty: null
  valueProperty: null
  yAxisLegend: null

  # returns the default configuration for the highchart
  # see: http://api.highcharts.com/highcharts
  chartOptions: ->
    {
      chart:
        type: 'line'
      title:
        text: @get('title')
      xAxis:
        type: 'category'
        labels: {
          rotation: -45
        }
      yAxis:
        min: 0
        title:
          text: @get('yAxisLegend')
      series: @get('series')
    }

  series: (->
    nameProperty = @get('nameProperty')
    valueProperty = @get('valueProperty')
    return [] if !valueProperty? || @get('values').length == 0

    [{
      name: @get('seriesName')
      data: @get('values').map((item) ->
        { name: item.get(nameProperty), y: item.get(valueProperty) }
      )
    }]
  ).property('values.[]', 'valueProperty', 'nameProperty')

  # trigger called by ember that is fired when the component is inserted into the page, not yet rendered
  # schedules the afterRender event in Ember's afterRender queue to render
  didInsertElement: ->
    @_super.apply(@, arguments)
    Ember.run.scheduleOnce('afterRender', @, @afterRenderEvent)
    return

  # renders the high chart on the page
  afterRenderEvent: ->
    @highChart = @$().highcharts(@chartOptions()).highcharts()
    return

  valuesObserver: (->
    return unless @highChart?
    series = @highChart.series[0] # get first series in the chart

    # if the series exists, update it with the new value, if not, add it
    if series
      series.update(@get('series'))
    else
      @highChart.addSeries(@get('series'))

    return
  ).observes('series.[]')
})

`export default LineChartComponent`

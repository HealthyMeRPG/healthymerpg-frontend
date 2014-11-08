`import Ember from 'ember'`

{ numeral } = window

QuestStatusComponent = Ember.Component.extend(
  tagName: 'div'
  quest: null
  metrics: null

  classNames: ['quest-status', 'progress']

  didInsertElement: ->
    @_super.apply(@, arguments)
    Ember.run.scheduleOnce('afterRender', @, @afterRenderEvent)

  afterRenderEvent: ->
    @$('.progress-bar').tooltip(title: "#{@get('progress')}%")
    @progressObserver()

  progress: (->
    progress = @get("metrics.#{@get('quest.activity')}") / @get('quest.activity_amount') * 100
    return 100 if progress >= 100
    numeral(progress).format('0.00')
  ).property('metrics')

  completed: (->
    @get('progress') == 100
  ).property('progress')

  progressObserver: (->
    @$('.progress-bar').css('width', "#{@get('progress')}%")
    return
  ).observes('progress')
)

`export default QuestStatusComponent`

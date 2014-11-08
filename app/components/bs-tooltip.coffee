`import Ember from 'ember'`

BootstrapTooltipComponent = Ember.Component.extend(
  bsAnimation: true
  bsContainer: false
  bsDelay: 0
  bsHtml: false
  bsPlacement: 'top'
  bsSelector: false
  bsTitle: null
  bsTrigger: 'hover focus'

  didInsertElement: ->
    @_super.apply(@, arguments)
    Ember.run.scheduleOnce('afterRender', @, @afterRenderEvent)

  afterRenderEvent: ->
    @$().tooltip(
      animation: @get('bsAnimation')
      container: @get('bsContainer')
      delay: @get('bsDelay')
      html: @get('bsHtml')
      placement: @get('bsPlacement')
      selector: @get('bsSelector')
      title: @get('bsTitle')
      trigger: @get('bsTrigger')
    )
)

`export default BootstrapTooltipComponent`

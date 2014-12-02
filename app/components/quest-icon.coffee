`import Ember from 'ember'`

QuestIconComponent = Ember.Component.extend(
  tagName: 'span'
  quest: null

  classNameBindings: ['questClass']
  classNames: ['quest-icon fa']

  questClass: ( ->
    activity = @get('quest.activity')
    return '' unless activity?
    if activity == 'calories_burned'
      'fa-fire'
    else if activity == 'very_active_minutes'
      'fa-bolt'
    else
      ''
  ).property('quest.activity')

  questIcon: ( ->
    activity = @get('quest.activity')
    return '' unless activity?
    if activity == 'steps'
      '/assets/images/steps-small.png'
    else if activity == 'floors_climbed'
      '/assets/images/stairs-small.png'
    else
      ''
  ).property('quest.activity')
)

`export default QuestIconComponent`

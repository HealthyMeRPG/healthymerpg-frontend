`import Ember from 'ember'`

TrackerIndexController = Ember.ArrayController.extend(
  fitbitTracker: (->
    @get('model').filterBy('tracker', 'fitbit').get('firstObject')
  ).property('model.length')

  hasFitbit: (->
    @get('fitbitTracker')?
  ).property('fitbitTracker')

  actions: {
    register: (tracker) ->
      Ember.$.get("/api/v1/authorize/#{tracker}").then((response) ->
        window.location.assign(response.url)
      )
      return

    unregister: (tracker) ->
      return unless @get('fitbitTracker')?

      if confirm("Are you sure you wish to unregister the tracker #{tracker.capitalize()}?")
        # disable the button
        # Ember.$("#unregister_#{tracker}").prop('disabled', true)

        # delete the tracker
        tracker = @get('fitbitTracker')
        tracker.deleteRecord()
        tracker.save()

      return
  }
)

`export default TrackerIndexController`

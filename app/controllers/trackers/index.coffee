`import Ember from 'ember'`

TrackerIndexController = Ember.Controller.extend(
  actions: {
    register: (tracker) ->
      Ember.$.get("/api/v1/authorize/#{tracker}").then((response) ->
        window.location.assign(response.url)
      )
      return
  }
)

`export default TrackerIndexController`

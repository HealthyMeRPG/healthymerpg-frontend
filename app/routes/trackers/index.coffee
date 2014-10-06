`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

TrackersIndexRoute = Ember.Route.extend(AuthenticatedRouteMixin, {
  model: ->
    @store.find('tracker')
})

`export default TrackersIndexRoute`

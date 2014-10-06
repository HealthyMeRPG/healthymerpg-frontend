`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend({
  location: config.locationType
})

Router.map(->
  @resource('sessions', ->
    @route('new')
  )
  @route('register')

  @route('dashboard')
  @resource('trackers', ->
  )
)

`export default Router`

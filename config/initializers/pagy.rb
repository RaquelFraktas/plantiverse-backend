
# frozen_string_literal: true

# Pagy DEFAULT Variables
# See https://ddnexus.github.io/pagy/api/pagy#variables
# All the Pagy::DEFAULT are set for all the Pagy instances but can be overridden per instance
# by just passing them to Pagy.new|Pagy::Countless.new|Pagy::Calendar.new or the #pagy controller method


# Instance variables
# See https://ddnexus.github.io/pagy/api/pagy#instance-variables
Pagy::DEFAULT[:page]   = 1                                  # default
Pagy::DEFAULT[:items]  = 25                                 # default
Pagy::DEFAULT[:outset] = 0                                  # default


# Other Variables
# See https://ddnexus.github.io/pagy/api/pagy#other-variables
Pagy::DEFAULT[:size]       = [1,4,4,1]                       # default
Pagy::DEFAULT[:page_param] = :page                           # default
# The :params can be also set as a lambda e.g ->(params){ params.exclude('useless').merge!('custom' => 'useful') }
Pagy::DEFAULT[:params]     = {}                              # default
# Pagy::DEFAULT[:fragment]   = '#fragment'                     # example
# Pagy::DEFAULT[:link_extra] = 'data-remote="true"'            # example
Pagy::DEFAULT[:i18n_key]   = 'pagy.item_name'                # default
# Pagy::DEFAULT[:cycle]      = true                            # example

# Backend Extras

# Array extra: Paginate arrays efficiently, avoiding expensive array-wrapping and without overriding
# See https://ddnexus.github.io/pagy/extras/array
require 'pagy/extras/array'


# Countless extra: Paginate without any count, saving one query per rendering
# See https://ddnexus.github.io/pagy/extras/countless
# require 'pagy/extras/countless'
# Pagy::DEFAULT[:countless_minimal] = false   # default (eager loading)

# Elasticsearch Rails extra: Paginate `ElasticsearchRails::Results` objects
# See https://ddnexus.github.io/pagy/extras/elasticsearch_rails
# default :pagy_search method: change only if you use also
# the searchkick or meilisearch extra that defines the same
# Pagy::DEFAULT[:elasticsearch_rails_search_method] = :pagy_search
# require 'pagy/extras/elasticsearch_rails'

# Headers extra: http response headers (and other helpers) useful for API pagination
# See http://ddnexus.github.io/pagy/extras/headers
# require 'pagy/extras/headers'
Pagy::DEFAULT[:headers] = { page: 'Current-Page',
                           items: 'Page-Items',
                           count: 'Total-Count',
                           pages: 'Total-Pages' }     # default


# Metadata extra: Provides the pagination metadata to Javascript frameworks like Vue.js, react.js, etc.
# See https://ddnexus.github.io/pagy/extras/metadata
# you must require the shared internal extra (BEFORE the metadata extra) ONLY if you need also the :sequels
# require 'pagy/extras/shared'
require 'pagy/extras/metadata'
# For performance reason, you should explicitly set ONLY the metadata you use in the frontend
Pagy::DEFAULT[:metadata] = %i[scaffold_url count page prev next last]   # example



# Frontend Extras

# Bootstrap extra: Add nav, nav_js and combo_nav_js helpers and templates for Bootstrap pagination
# See https://ddnexus.github.io/pagy/extras/bootstrap
# require 'pagy/extras/bootstrap'


# Overflow extra: Allow for easy handling of overflowing pages
# See https://ddnexus.github.io/pagy/extras/overflow
# require 'pagy/extras/overflow'
# Pagy::DEFAULT[:overflow] = :empty_page    # default  (other options: :last_page and :exception)

# Support extra: Extra support for features like: incremental, infinite, auto-scroll pagination
# See https://ddnexus.github.io/pagy/extras/support
# require 'pagy/extras/support'

# Trim extra: Remove the page=1 param from links
# See https://ddnexus.github.io/pagy/extras/trim
require 'pagy/extras/trim'
# set to false only if you want to make :trim_extra an opt-in variable
Pagy::DEFAULT[:trim_extra] = false # default true




# Rails: extras assets path required by the helpers that use javascript
# (pagy*_nav_js, pagy*_combo_nav_js, and pagy_items_selector_js)
# See https://ddnexus.github.io/pagy/extras#javascript
# Rails.application.config.assets.paths << Pagy.root.join('javascripts')



# When you are done setting your own default freeze it, so it will not get changed accidentally
Pagy::DEFAULT.freeze
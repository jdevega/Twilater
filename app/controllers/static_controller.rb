class StaticController < ApplicationController
	skip_before_filter :user_must_be_logged
end

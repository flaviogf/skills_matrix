class SkillsController < ApplicationController
  before_action { authorize(:admin) }

  def index
  end
end

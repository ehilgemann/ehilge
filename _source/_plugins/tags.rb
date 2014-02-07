module Jekyll
  class ProjectTag < Liquid::Tag
    def initialize(tag_name, project, tokens)
      super
      arguments = project.split(",")
      @project = arguments[0]
      @classes = arguments[1]
    end

    def render(context)
      %|
        <div class="project #{@classes}">
          <img src="/assets/images/makes/#{@project}.jpg" retina="/assets/images/makes/#{@project}@2x.jpg">
        </div>
       |
    end

    Liquid::Template.register_tag "project", self
  end
end
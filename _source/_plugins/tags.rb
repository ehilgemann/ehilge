module Jekyll
  class ProjectTag < Liquid::Tag
    def initialize(tag_name, project, tokens)
      super
      arguments = project.split(" ")
      @project = arguments[0]

      # Do define a project type if a second argument is passed.
      if arguments.size == 2
        @project_type = arguments[1]
      end
    end

    def render(context)
      if @project_type
        # Do something here if I define a project type.
      else
        # Drop in project image, assuming there’s a retina version too.
        %|<img src="/assets/images/makes/#{@project}.jpg" retina="/assets/images/makes/#{@project}@2x.jpg">|
      end
    end

    Liquid::Template.register_tag "project", self
  end
end
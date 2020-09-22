module MenuHelpers
  Children= Struct.new(:label, :base_slug, :pages)
  CustomMenu = Struct.new(:label, :slug, :children) do
    def to_ary
      [label, slug, children]
    end
  end
end

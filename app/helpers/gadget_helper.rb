module GadgetHelper
  def list_picture_for(gadget)
    image_tag gadget.pictures.first.image.small if gadget.pictures.any?
  end

  def thumb_picture_url_for(gadget)
    gadget.pictures.first.image.thumb if gadget.pictures.any?
  end

  def cover_picture_url_for(gadget)
    gadget.pictures.first.image if gadget.pictures.any?
  end

  def classes_for_modes(mode, current_mode)
    classes = 'btn btn-default'
    classes << ' active' if current_mode == mode
    classes
  end

  def link_to_mode(mode)
    link_to mode.humanize, gadgets_path(mode: mode),
      :class => classes_for_modes(mode, params[:mode])
  end
end

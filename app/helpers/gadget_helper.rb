module GadgetHelper
  def cover_picture_for(gadget)
    image_tag gadget.pictures.first.image.thumb if gadget.pictures.any?
  end
end

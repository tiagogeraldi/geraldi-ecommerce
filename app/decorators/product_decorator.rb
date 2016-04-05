class ProductDecorator < Draper::Decorator
  delegate_all

  def label
    if sold_out || promotion
      h.content_tag :span, class: label_class do
        if sold_out
          Product.human_attribute_name :sold_out
        elsif promotion
          Product.human_attribute_name :promotion
        end
      end
    end
  end

  def discount
    if source.discount && source.discount > 0
      h.content_tag :span, class: 'label label-primary pull-right' do
        h.number_to_percentage(source.discount, precision: 0).to_s + ' off!'
      end
    end
  end

  def first_shot_url
    product_shots.first.image(:small) if product_shots.any?
  end

  private

  def label_class
    if sold_out
      'pull-right label label-danger'
    elsif promotion
      'pull-right label label-primary'
    end
  end
end

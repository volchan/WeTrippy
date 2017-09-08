module ApplicationHelper
  def display_rating(experience)
    rating = calc_rating(experience)

    if rating < 0.25
      image_tag('empty_star.svg', class: 'rating-star').to_s * 5
    elsif rating >= 0.25 && rating < 0.5
      "#{image_tag('1_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 4}"
    elsif rating >= 0.5 && rating < 0.75
      "#{image_tag('half_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 4}"
    elsif rating >= 0.75 && rating < 1
      "#{image_tag('3_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 4}"
    elsif rating >= 1 && rating < 1.25
      "#{image_tag('full_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 4}"
    elsif rating >= 1.25 && rating < 1.5
      "#{image_tag('full_star.svg', class: 'rating-star')}#{image_tag('1_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 3}"
    elsif rating >= 1.5 && rating < 1.75
      "#{image_tag('full_star.svg', class: 'rating-star')}#{image_tag('half_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 3}"
    elsif rating >= 1.75 && rating < 2
      "#{image_tag('full_star.svg', class: 'rating-star')}#{image_tag('3_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 3}"
    elsif rating >= 2 && rating < 2.25
      "#{image_tag('full_star.svg', class: 'rating-star') * 2}#{image_tag('empty_star.svg', class: 'rating-star') * 3}"
    elsif rating >= 2.25 && rating < 2.5
      "#{image_tag('full_star.svg', class: 'rating-star') * 2}#{image_tag('1_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 2}"
    elsif rating >= 2.5 && rating < 2.75
      "#{image_tag('full_star.svg', class: 'rating-star') * 2}#{image_tag('half_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 2}"
    elsif rating >= 2.75 && rating < 3
      "#{image_tag('full_star.svg', class: 'rating-star') * 2}#{image_tag('3_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 2}"
    elsif rating >= 3 && rating < 3.25
      "#{image_tag('full_star.svg', class: 'rating-star') * 3}#{image_tag('empty_star.svg', class: 'rating-star') * 2}"
    elsif rating >= 3.25 && rating < 3.5
      "#{image_tag('full_star.svg', class: 'rating-star') * 3}#{image_tag('1_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 1}"
    elsif rating >= 3.5 && rating < 3.75
      "#{image_tag('full_star.svg', class: 'rating-star') * 3}#{image_tag('half_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 1}"
    elsif rating >= 3.75 && rating < 4
      "#{image_tag('full_star.svg', class: 'rating-star') * 3}#{image_tag('3_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 1}"
    elsif rating >= 4 && rating < 4.25
      "#{image_tag('full_star.svg', class: 'rating-star') * 4}#{image_tag('empty_star.svg', class: 'rating-star') * 2}"
    elsif rating >= 4.25 && rating < 4.5
      "#{image_tag('full_star.svg', class: 'rating-star') * 4}#{image_tag('1_4_star.svg', class: 'rating-star')}"
    elsif rating >= 4.5 && rating < 4.75
      "#{image_tag('full_star.svg', class: 'rating-star') * 4}#{image_tag('half_star.svg', class: 'rating-star')}"
    elsif rating >= 4.75 && rating < 5
      "#{image_tag('full_star.svg', class: 'rating-star') * 4}#{image_tag('3_4_star.svg', class: 'rating-star')}"
    elsif rating >= 5
      image_tag('full_star.svg', class: 'rating-star').to_s * 5
    end
  end

  def calc_rating(experience)
    experience.comments.average(:rating)
  end
end

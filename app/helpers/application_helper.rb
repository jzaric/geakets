module ApplicationHelper
  def popular_tags
    Tag.all(
      :select => "tags.*, COUNT(tags.id) as geakets_count",
      :joins => "INNER JOIN geakets_tags ON tags.id = geakets_tags.tag_id",
      :group => "tags.id",
      #:order => "RAND()",
      :limit => 32)
  end

  def most_popular_tag_count
    if @most_popular_tag_count.nil?
      most_popular_tag = Tag.first(
        :select => "tags.*, COUNT(tags.id) as geakets_count",
        :joins => "INNER JOIN geakets_tags ON tags.id = geakets_tags.tag_id",
        :group => "tags.id",
        :order => "geakets_count DESC",
        :limit => 1)
      if most_popular_tag.nil?
        @most_popular_tag_count = 0
      else
        @most_popular_tag_count = most_popular_tag.geakets_count
      end
    end
    return @most_popular_tag_count
  end
  def tag_level(tag)
    return (5.0 * tag.geakets_count / most_popular_tag_count).ceil
  end
end

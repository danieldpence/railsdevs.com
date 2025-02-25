require "test_helper"

class SearchStatusComponentTest < ViewComponent::TestCase
  setup do
    @developer = developers(:available)
  end

  test "actively looking" do
    @developer.search_status = :actively_looking
    render_inline SearchStatusComponent.new(@developer)
    assert_text /actively looking/i
  end

  test "open" do
    @developer.search_status = :open
    render_inline SearchStatusComponent.new(@developer)
    assert_text /open/i
  end

  test "not interested" do
    @developer.search_status = :not_interested
    render_inline SearchStatusComponent.new(@developer)
    assert_text /not interested/i
  end

  test "none" do
    @developer.search_status = nil
    render_inline SearchStatusComponent.new(@developer)
    assert_no_selector "*"
  end
end

require "test_helper"

class AnggotaKeluargasImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get anggota_keluargas_imports_new_url
    assert_response :success
  end

  test "should get create" do
    get anggota_keluargas_imports_create_url
    assert_response :success
  end
end

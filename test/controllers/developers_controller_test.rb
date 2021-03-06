require "test_helper"

class DevelopersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_developer_path

    assert_response :success
  end

  test 'should create developer' do
    assert_difference('Developer.count') do
      post developers_path, params: {
        developer: {
          email: 'frank@email.com',
          developer_skills_attributes: [
            { skill_id: skills(:ruby).id, points: 5 }
          ]
        }
      }
    end

    assert_redirected_to new_developer_path
  end

  test 'should not create developer if attributes are invalid' do
    post developers_path, params: { developer: { email: '' } }

    assert_response :unprocessable_entity
  end

  test 'should get index' do
    sign_in users(:frank)

    get developers_path

    assert_response :success
  end

  test 'should not get index if user is not authorized' do
    get developers_path

    assert_redirected_to new_sessions_path
  end

  test 'should delete developer' do
    sign_in users(:frank)

    assert_difference('Developer.count', -1) do
      delete developer_path(developers(:peter))
    end

    assert_redirected_to developers_path
  end
end

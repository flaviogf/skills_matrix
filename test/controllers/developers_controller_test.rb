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
    get developers_path

    assert_response :success
  end
end

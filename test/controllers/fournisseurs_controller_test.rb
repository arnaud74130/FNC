require 'test_helper'

class FournisseursControllerTest < ActionController::TestCase
  setup do
    @fournisseur = fournisseurs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fournisseurs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fournisseur" do
    assert_difference('Fournisseur.count') do
      post :create, fournisseur: { code: @fournisseur.code, email: @fournisseur.email, raison_sociale: @fournisseur.raison_sociale }
    end

    assert_redirected_to fournisseur_path(assigns(:fournisseur))
  end

  test "should show fournisseur" do
    get :show, id: @fournisseur
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fournisseur
    assert_response :success
  end

  test "should update fournisseur" do
    patch :update, id: @fournisseur, fournisseur: { code: @fournisseur.code, email: @fournisseur.email, raison_sociale: @fournisseur.raison_sociale }
    assert_redirected_to fournisseur_path(assigns(:fournisseur))
  end

  test "should destroy fournisseur" do
    assert_difference('Fournisseur.count', -1) do
      delete :destroy, id: @fournisseur
    end

    assert_redirected_to fournisseurs_path
  end
end

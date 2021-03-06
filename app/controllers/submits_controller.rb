class SubmitsController < ApplicationController
  before_action :set_submit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /submits
  # GET /submits.json
  def index
    @submits = Submit.where(user_id: current_user.id)
  end

  # GET /submits/1
  # GET /submits/1.json
  def show
  end

  # GET /submits/new
  def new
    @submit = Submit.new
  end

  # POST /submits
  # POST /submits.json
  def create
    @submit = Submit.new(submit_params)
    @submit.user = current_user

    # save the file
    upload_file = submit_params[:file]
    if upload_file != nil
      @submit.content = upload_file.read
    end

    # count try count
    @submit.try_count =Submit.where(exercise_id: @submit.exercise_id, user_id: @submit.user_id, ).count + 1

    respond_to do |format|
      if @submit.save
        # Badge 認定
        if @submit.result == "Success!"
          badge = Badge.where(exercise_id: @submit.exercise_id, user_id: @submit.user_id )[0]
          badge.certification = 1
          badge.save
        end

        format.html { redirect_to @submit, notice: 'Submit was successfully created.' }
        format.json { render :show, status: :created, location: @submit }
      else
        format.html { render :new }
        format.json { render json: @submit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submits/1
  # DELETE /submits/1.json
  def destroy
    @submit.destroy
    respond_to do |format|
      format.html { redirect_to submits_url, notice: 'Submit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submit
      @submit = Submit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submit_params
      params.require(:submit).permit(:user_id, :exercise_id, :result, :try_count, :file)
    end
end

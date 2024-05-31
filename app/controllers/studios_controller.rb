class StudiosController < ApplicationController

  def show
    @studio = Studio.find(params[:id])
  end

  def edit
    @studio = Studio.find(params[:id])
  end

  def update
    @studio = Studio.find(params[:id])
    respond_to do |format|
      if @studio.update(studio_params)
        format.html { redirect_to @studio, notice: 'Studio was successfully updated.' }
        format.json { render :show, status: :ok, location: @studio }
      else
        format.html { render :edit }
        format.json { render json: @studio.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def studio_params
    params.require(:studio).permit(:name, :short_name, :japanese, :website)
  end

end

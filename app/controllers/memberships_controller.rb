class MembershipsController < ApplicationController

    def create
      gym = Gym.find(params[:gym_id])
      new_membership = gym.memberships.create(membership_params)
    
        if new_membership.save
          render json: new_membership, status: :created
        else
          render json: { errors: new_membership.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    def destroy
        membership = Membership.find_by(id: params[:id])
    
        if membership
          membership.destroy
          render json: {}, status: :no_content
        else
          render json: { error: 'Membership not found' }, status: :not_found
        end
    end
    
    private
    
    def membership_params
        params.require(:membership).permit(:client_id, :charge)
    end

end

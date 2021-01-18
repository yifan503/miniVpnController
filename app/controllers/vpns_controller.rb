require 'open3'

class VpnsController < ApplicationController
    def index
        @vpns = Vpn.all
        stdout, stderr, status = Open3.capture3("ps -ef|grep pppd")
        @pppd_status = stdout
    end

    def new
        @vpn = Vpn.new
    end

    def create
        @vpn=get_vpn()
        if @vpn.save
            flash[:notice] = "vpn saved successfully"
        else
            flash[:notice] = "vpn has not saved correctly"
        end
        redirect_to action: 'index'
    end
    
    def disconnect_all
        render :json=>{}
    end
    
    def show
        
    end

    def connect
        @vpn = Vpn.find_by(name: params["vpn_name"])
        logger.info(params["vpn_name"])
        logger.info(@vpn)
        render :json=>{}
    end
    
    def edit
        @vpn = get_vpn()
    end

    def update
        @vpn = get_vpn()
        if @vpn.update(vpn_params)
            flash[:notice] = "vpn updated successfully"
            redirect_to action:'index'
        else
            flash.now[:notice] = "vpn updated successfully"
            render 'edit'
        end
    end
    
    def destroy
        @vpn = get_vpn()
        if @vpn.destroy
            flash[:notice] = "vpn deleted successfully"
        else
            flash[:notice] = "vpn has not deleted correctly"
        end
        redirect_to action:'index'
    end

    private
    def vpn_params
        params.require(:vpn).permit(:name,:ipaddress,:ipaddress_bk)
    end

    def get_vpn
        @vpn = Vpn.find(params[:id])
    end
end

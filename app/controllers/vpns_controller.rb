class VpnsController < ApplicationController
    def index
    end

    def new
    end

    def create
        @vpn=Vpn.new({name:params[:name],ipaddress:params[:ipaddress],ipaddress_bk:params[:ipaddress_bk]})
        if @vpn.save
            flash[:notice] = "vpn saved successfully"
        else
            flash[:notice] = "vpn has not saved correctly"
        end
        redirect_to action: 'index'
    end

    def show
        
    end
end

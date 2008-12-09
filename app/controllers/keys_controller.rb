class KeysController < ApplicationController
  # GET /keys
  # GET /keys.xml
  def index
    @keys = Key.find_key_without_parent
    @namespaces = Key.find_namespaces
    
    p @namespaces
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @key = Key.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @key }
    end
  end

  # GET /keys/new
  # GET /keys/new.xml
  def new
    @key = Key.new
    @namespaces = Key.find_namespaces
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @key }
    end
  end

  # GET /keys/1/edit
  def edit
    @key = Key.find(params[:id])
  end

  # POST /keys
  # POST /keys.xml
  def create
    @key = Key.new(params[:key])

    respond_to do |format|
      if @key.save
        flash[:notice] = 'Key was successfully created.'
        format.html { redirect_to keys_path }
        format.xml  { render :xml => @key, :status => :created, :location => @key }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @key.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /keys/1
  # PUT /keys/1.xml
  def update
    @key = Key.find(params[:id])

    respond_to do |format|
      if @key.update_attributes(params[:key])
        flash[:notice] = 'Key was successfully updated.'
        format.html { redirect_to(@key) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @key.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /keys/1
  # DELETE /keys/1.xml
  def destroy
    @key = Key.find(params[:id])
    @key.destroy

    respond_to do |format|
      format.html { redirect_to(keys_url) }
      format.xml  { head :ok }
    end
  end
end

class RainDataController < ApplicationController
  before_action :set_rain_datum, only: [:show, :edit, :update, :destroy]

  # GET /rain_data
  # GET /rain_data.json
  def index
    field =  params[:q] || "annual"
    areas =  ["ANDAMAN & NICOBAR ISLANDS", "ARUNACHAL PRADESH", "ASSAM & MEGHALAYA", "BIHAR ", "CHATTISGARH", "COASTAL KARNATAKA", "COSTAL ANDHRA PRADESH", "EAST  RAJASTHAN ", "EAST MADHYA PRADESH", "EAST UTTAR PRADESH", "GANGETIC WEST BENGAL", "GUJARAT REGION, DADRA & NAGAR HAVELI", "HARYANA, DELHI & CHANDIGARH", "HIMACHAL PRADESH", "JAMMU & KASHMIR", "JHARKHAND", "KERALA", "KOKAN & GOA", "LAKSHADWEEP ", "MADHYA MAHARASHTRA", "MARATWADA ", "NAGALAND, MANIPUR, MIZORAM,TRIPURA", "NORTH INTERIOR KARNATAKA", "ORISSA", "PUNJAB ", "RAYALSEEMA", "SAURASHTRA KUTCH & DIU", "SOUTH INTERIOR KARNATAKA", "SUB-HIMALAYAN W BENGAL & SIKKIM", "TAMIL NADU & PONDICHERRY", "TELENGANA", "UTTARANCHAL", "VIDARBHA", "WEST MADHYA PRADESH", "WEST RAJASTHAN ", "WEST UTTAR PRADESH"]
    hash =  {}

    RainDatum.where(name: areas).group(:name, :year).pluck(:year, :annual, :name).each {|d|
      hash[d[0]] ||= []
      hash[d[0]].push([d[2],d[1]])
    }

    data = []
    hash.each do |year,val|
      data.push(
          year => states.map do |state, v|
            { "hc-key" => v[:key], value: val.map { |vv| vv[1] if v[:region].include?(vv[0]) }.compact.sum }
          end
        )
    end

    respond_to do |format|
      format.html {}
      format.json {
        render json: data
      }
    end
  end

  # GET /rain_data/1
  # GET /rain_data/1.json
  def show
  end

  # GET /rain_data/new
  def new
    @rain_datum = RainDatum.new
  end

  # GET /rain_data/1/edit
  def edit
  end

  # POST /rain_data
  # POST /rain_data.json
  def create
    @rain_datum = RainDatum.new(rain_datum_params)

    respond_to do |format|
      if @rain_datum.save
        format.html { redirect_to @rain_datum, notice: 'Rain datum was successfully created.' }
        format.json { render :show, status: :created, location: @rain_datum }
      else
        format.html { render :new }
        format.json { render json: @rain_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rain_data/1
  # PATCH/PUT /rain_data/1.json
  def update
    respond_to do |format|
      if @rain_datum.update(rain_datum_params)
        format.html { redirect_to @rain_datum, notice: 'Rain datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @rain_datum }
      else
        format.html { render :edit }
        format.json { render json: @rain_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rain_data/1
  # DELETE /rain_data/1.json
  def destroy
    @rain_datum.destroy
    respond_to do |format|
      format.html { redirect_to rain_data_url, notice: 'Rain datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rain_datum
      @rain_datum = RainDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rain_datum_params
      params.require(:rain_datum).permit(:name, :year, :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec, :annual, :jan_feb, :mar_may, :jun_sep, :oct_dec)
    end

    def states
      @states ||= {
        "ANDAMAN & NICOBAR ISLANDS" => {region: ["ANDAMAN & NICOBAR ISLANDS"], key: "in-an"},
        "ARUNACHAL PRADESH" => {region: ["ARUNACHAL PRADESH"], key: "in-ar"},
        "ASSAM" => {region: ["ASSAM & MEGHALAYA"], key: "in-as"},
        "MEGHALAYA" => {region: ["ASSAM & MEGHALAYA"], key: "in-ml"},
        "BIHAR" => {region: ["BIHAR "], key: "in-br"},
        "CHATTISGARH" => {region: ["CHATTISGARH"], key: "in-ct"},
        "KARNATAKA" => {region: ["COASTAL KARNATAKA", "NORTH INTERIOR KARNATAKA", "SOUTH INTERIOR KARNATAKA"], key: "in-ka"},
        "ANDHRA PRADESH" => {region: ["COSTAL ANDHRA PRADESH", "RAYALSEEMA", "TELENGANA"], key: "in-ap"},
        "MADHYA PRADESH" => {region: ["EAST MADHYA PRADESH", "WEST MADHYA PRADESH"], key: "in-mp"},
        "RAJASTHAN" => {region: ["EAST  RAJASTHAN ","WEST RAJASTHAN "], key: "in-rj"},
        "UTTAR PRADESH" => {region: ["EAST UTTAR PRADESH", "WEST UTTAR PRADESH"], key: "in-up"},
        "WEST BENGAL" => {region: ["GANGETIC WEST BENGAL"], key: "in-wb"},
        "GUJARAT" => {region: ["GUJARAT REGION, DADRA & NAGAR HAVELI", "SAURASHTRA KUTCH & DIU"], key: "in-2984"},
        "HARYANA" => {region: ["HARYANA, DELHI & CHANDIGARH"], key: "in-hr"},
        "DELHI" => {region: ["HARYANA, DELHI & CHANDIGARH"], key: "in-dl"},
        "HIMACHAL PRADESH" => {region: ["HIMACHAL PRADESH"], key: "in-hp"},
        "JAMMU & KASHMIR" => {region: ["JAMMU & KASHMIR"], key: "in-jk"},
        "JHARKHAND" => {region: ["JHARKHAND"], key: "in-jh"},
        "KERALA" => {region: ["KERALA"], key: "in-kl"},
        "GOA" => {region: ["KOKAN & GOA"], key: "in-ga"},
        "LAKSHADWEEP" => {region: ["LAKSHADWEEP "], key: "in-ld"},
        "MAHARASHTRA" => {region: ["MADHYA MAHARASHTRA","MARATWADA ", "VIDARBHA"], key: "in-mh"},
        "NAGALAND" => {region: ["NAGALAND, MANIPUR, MIZORAM,TRIPURA"], key: "in-nl"},
        "MANIPUR" => {region: ["NAGALAND, MANIPUR, MIZORAM,TRIPURA"], key: "in-mn"},
        "MIZORAM" => {region: ["NAGALAND, MANIPUR, MIZORAM,TRIPURA"], key: "in-mz"},
        "TRIPURA" => {region: ["NAGALAND, MANIPUR, MIZORAM,TRIPURA"], key: "in-tr"},
        "ORISSA" => {region: ["ORISSA"], key: "in-or"},
        "PUNJAB" => {region: ["PUNJAB "], key: "in-pb"},
        "SIKKIM" => {region: ["SUB-HIMALAYAN W BENGAL & SIKKIM"], key: "in-sk"},
        "TAMIL NADU" => {region: ["TAMIL NADU & PONDICHERRY"], key: "in-tn"},
        "PONDICHERRY" => {region: ["TAMIL NADU & PONDICHERRY"], key: "in-py"},
        # "TELENGANA" => {region: ["TELENGANA"], key: ""},
        "UTTARANCHAL" => {region: ["UTTARANCHAL"], key: "in-ut"}
      }
    end

end

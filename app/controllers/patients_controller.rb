class PatientsController < ApplicationController

  before_filter :create_patient_from_params, :only => :create
  load_and_authorize_resource

  def show
  end

  def index
    @patients = @patients.paginate(:page => params[:page])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: PatientsDatatable.new(view_context,current_ability)}
    end
  end

  def setup_assessment assessment
    assessment.form.questions.sorted.each do |q|
      if !q.nil?
        if assessment.answer(q).nil?
          assessment.answers_attributes= [{:question => q}]
        end
      end
    end
    return assessment
  end

  def destroy
    #doing safe delete
    @patient.delete

      respond_to do |format|
        format.html { redirect_to patients_path }
        format.json { head :no_content }
      end
  end
    def set_session patient
    steps_count= patient.new_patient_assessment.form.questions.where(input_type: "Start_section").count
       a=[]
       steps_count.times.each do |step|
         a << step+1
       end
       $dat = a
       session[:current_step] = a.first
  end
  def new
    session[:myform_params] ||= {}
    @patient = Patient.new
     if session[:current_step].blank?

      set_session @patient
    end
    @patient.current_step = session[:current_step]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    patient_params = params[:patient]
    assessment_params = params[:patient].delete(:assessment)
    is_updated = @patient.new_patient_assessment.update_assessment(assessment_params,current_user)
    is_updated = is_updated && @patient.update_attributes(patient_params)
    if is_updated
      @patient.update_values
    end
    respond_to do |format|
      if is_updated
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end


  def create_patient_from_params
    session[:myform_params].deep_merge!(params[:patient]) if params[:patient]
    params[:patient] = session[:myform_params]
    patient_params = params[:patient].clone
    patient_params.delete(:assessment)
    @patient = Patient.new(patient_params)
  end

  # POST /patients
  # POST /patients.json  
  
  def create
        @patient.current_step = session[:current_step]
    if params[:previous_button]
       @patient.previous_step
      session[:current_step] = @patient.current_step
      render :new
    elsif @patient.last_step?
      
      assessment_params = params[:patient].delete(:assessment)
      is_updated = @patient.new_patient_assessment.update_assessment(assessment_params,current_user)
      if is_updated
        @patient.update_values
      end
      session[:current_step] = session[:myform_params] = nil

      respond_to do |format|
        if @patient.save
          format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
          format.json { render json: @patient, status: :created, location: @patient }
        else
          format.html { render action: "new" }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
        end
      end
    else

      @patient.next_step
                     session[:current_step] = @patient.current_step


      render :new
    end  ####false
     
  end
    
end

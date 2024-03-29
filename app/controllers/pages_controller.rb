class PagesController < ApplicationController
	layout 'admin'
	before_filter :confirm_logged_in
	before_filter :find_subject
	def index
		list
		render('list')
	end
	def list
		@pages = Page.sorted.where(:subject_id => @subject.id)
	end
	def show
		@page = Page.find(params[:id])
	end
	def new
		@subjects = Subject.all
		@page_count = @subject.pages.size + 1
		@page = Page.new(:subject_id => @subject.id)
	end
	def create
		new_position = params[:page].delete(:position)
		@page = Page.new(params[:page])
		if @page.save
			@page.move_to_position(new_position)
			flash[:notice]= "Page created."
			redirect_to(:action => 'list', :subject_id => @page.subject_id)
		else
			@page_count = @subject.pages.size + 1
			render('new')
		end
	end
	def edit
		@subjects = Subject.all
		@page = Page.find(params[:id])
		@page_count = @subject.pages.size
	end
	def update
		@page = Page.find(params[:id])
		new_position = params[:page].delete(:position)
		if @page.update_attributes(params[:page])
			@page.move_to_position(new_position)
			flash[:notice]= "Page updated."
			redirect_to(:action => 'show', :id => @page.id, :subject_id => @page.subject_id)
		else
			@page_count = @subject.pages.size
			render('edit')
		end
	end
	def delete
		@page = Page.find(params[:id])
	end
	def destroy
		@page = Page.find(params[:id])
		@page.move_to_position(nil)
		@page.destroy
		flash[:notice]= "Page destroyed."
		redirect_to(:action => 'list', :subject_id => @page.subject_id)
	end

	private
	def find_subject
		if params[:subject_id]
			@subject = Subject.find_by_id(params[:subject_id])
		end
	end
end

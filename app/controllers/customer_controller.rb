class CustomerController < ApplicationController
  before_filter :authenticate_customer!
end
# frozen_string_literal: true

require 'ffi'
require 'ruby_objc_corefoundation/version'
module RubyObjcCorefoundation
  extend FFI::Library
  ffi_lib '/Users/rishi/ruby_objc_corefoundation/CFPrefs/DerivedData/CFPrefs/Build/Products/Debug/CFPrefs'

  attach_function :GetPreferencesValue, %i[string string string string string], :pointer
end

class RubyData < FFI::Struct
  layout :dataType, :string,
         :value, :pointer
end

idle_time = RubyData.new RubyObjcCorefoundation.GetPreferencesValue('idleTime', 'com.apple.screensaver', 'rishi', 'MacBook-Pro-2.local', 'local')
p idle_time
token_removal_action = RubyData.new RubyObjcCorefoundation.GetPreferencesValue('tokenRemovalAction', 'com.apple.screensaver', 'rishi', 'MacBook-Pro-2.local', 'local')
p token_removal_action
array_key = RubyData.new RubyObjcCorefoundation.GetPreferencesValue('arraykey', 'rishi.testdomain.test', 'rishi', 'MacBook-Pro-2.local', 'local')
p array_key

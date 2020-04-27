# typed: strict
# frozen_string_literal: true

module Lumise
  class Configurations < T::Struct
    include Singleton

    prop :force,        T::Boolean, default: false
    prop :plugins,      T.nilable(T::Array[String])
    prop :repo,         T.nilable(String)
    prop :branch,       T.nilable(String)
    prop :update_gems,  T.nilable(T::Boolean)
    prop :update_files, T.nilable(T::Boolean)
    prop :update_todo,  T.nilable(T::Boolean)
  end
end

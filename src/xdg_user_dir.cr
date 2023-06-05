@[Link(ldflags: "#{__DIR__}/xdg-user-dir-lookup.o")]
lib LibXdgUserDir
  fun xdg_user_dir_lookup(type : LibC::Char*) : LibC::Char*
end

module XdgUserDir
  # Current shard version
  VERSION = {{ `shards version #{__DIR__}`.strip.stringify }}

  # Default XDG user directory types
  enum Type
    # :nodoc:
    DESKTOP
    Desktop = DESKTOP
    # :nodoc:
    DOWNLOAD
    Downloads = DOWNLOAD
    # :nodoc:
    TEMPLATES
    Templates = TEMPLATES
    # :nodoc:
    PUBLICSHARE
    PublicShare = PUBLICSHARE
    # :nodoc:
    DOCUMENTS
    Documents = DOCUMENTS
    # :nodoc:
    MUSIC
    Music = MUSIC
    # :nodoc:
    PICTURES
    Pictures = PICTURES
    # :nodoc:
    VIDEOS
    Videos = VIDEOS
  end

  @@cache = Hash(String, Path).new

  # Same as `#lookup(type : Type, *, use_cache = true)`, but accepts a custom *type*.
  #
  # Example of types are "DESKTOP" and "DOWNLOAD".
  def lookup(type : String, *, use_cache = true) : Path
    return lookup_impl(type) unless use_cache

    @@cache[type] ||= lookup(type, use_cache: false)
  end

  # Looks up a XDG user directory of the specified *type*.
  #
  # If *use_cache* is false, the cache isn't used or updated.
  #
  # If a directory for the type is not specified by the user the default
  # is the home directory. Except for `Type::Desktop` which defaults
  # to ~/Desktop.
  def lookup(type : Type, *, use_cache = true) : Path
    lookup(type.to_s, use_cache: use_cache)
  end

  private def lookup_impl(type : String) : Path
    ptr = LibXdgUserDir.xdg_user_dir_lookup(type)
    str = String.new(ptr)
    LibC.free(ptr)
    Path.new(str)
  end

  # Clear cache.
  def clear_cache : Nil
    @@cache.clear
  end

  extend self
end

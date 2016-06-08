# CHANGELOG

## 1.2.0 (Jun 08, 2016)

1. (New) Add `FalseClass#_cl_to_bool` and `TrueClass#cl_to_bool`.
2. (New) Add `Hash#cl_fetch_ignoring_nil`.

## 1.1.0 (May 20, 2016)

1. (New) Add hash `Hash#cl_add_if_absent` and `Hash#cl_update_if_present`.

## 1.0.0 (May 09, 2016)

1. (Change) Change method prefix to `cl_`.  This is a major breaking change.
2. (New) Add optional method alias `_`.
3. (New) Add many new methods.
4. (New) Fill out test suite on methods.

## 0.0.2 (May 06, 2016)

1. (New) Add **Array** methods: `#co_delete!`
2. (Change) All methods now have a `co_` prefix to help prevent method name collisions with other libraries.

## 0.0.1 (Oct 09, 2015)

1. (New) Added **String** methods: `#first, #first_or_nil, #last, #last_or_nil, #first_words, #force_leading_space, #all_spaces?`
2. (New) Added **Hash** methods: `#extract`

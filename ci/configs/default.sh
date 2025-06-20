CI_DESC="CI job using default libraries and tools"
CI_DIR=build-default
export CXXFLAGS="-Werror -Wall -Wextra -Wpedantic -Wno-unused-parameter"
BUILD_ARGS=(-k)

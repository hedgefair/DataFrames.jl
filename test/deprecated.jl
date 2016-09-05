using DataFrames, FileIO, RDatasets, Compat
fn = tempname()
open(fn, "w") do f
    redirect_stderr(f) do
        dataset("datasets", "iris")
    end
end
@test contains(readstring(fn), "WARNING: read_rda() is deprecated. R data format support has been moved to the RData package. Use FileIO.load() instead.")

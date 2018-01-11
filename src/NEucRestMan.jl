manhattanDistanceModifier = 0.5

struct NEucRestMan <: Metric
    N::Int
    k::Float64
end

ThreeEucRestMan() = ThreeEucRestMan(3, 1)

function Distances.evaluate(dist::NEucRestMan, a::AbstractVector{Real}, b::AbstractVector{Real}, do_end::Bool)
    return euclidean(a[1:dist.N], b[1:dist.N]) + dist.k * cityblock(a[dist.N+1:end], b[dist.N+1:end])
end

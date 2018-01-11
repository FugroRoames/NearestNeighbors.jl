manhattanDistanceModifier = 0.5

""" Creates a metric with the following distance function:
Given two vectors a,b:
dist(a,b) = euclidean_dist(first N elements of a, " " " " b) + k * manhattan_distance(rest of a, " " b)
"""
struct NEucRestMan <: Metric
    N::Int
    k::Float64
end

ThreeEucRestMan() = ThreeEucRestMan(3, 1)

function Distances.evaluate(dist::NEucRestMan, a::AbstractVector{Real}, b::AbstractVector{Real}, do_end::Bool)
    return euclidean(a[1:dist.N], b[1:dist.N]) + dist.k * cityblock(a[dist.N+1:end], b[dist.N+1:end])
end

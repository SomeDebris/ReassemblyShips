module ReassemblyShips

using JSON3
using StructTypes
using StaticArrays
using BitFlags

# all of the Reassembly blocks features!
@bitflag BlockFeatures::UInt64 begin
    COMMAND
    THRUSTER
    GENERATOR
    PERISHABLE
    TURRET
    LAUNCH
    CANNON
    LASER
    AUTOFIRE
    SHIELD
    TORQUER
    LAUNCHER
    EXPLODE
    ASSEMBLER
    REGROWER
    CANNON_BOOST
    INVULNERABLE
    NOREGEN
    PERSISTENT
    ENVIRONMENTAL
    TRACTOR
    ROOT
    GROW
    PHOTOSYNTH
    AUTOLAUNCH
    FREERES
    FACTORY
    SEED
    MELEE
    UNGROW
    UNIQUE
    CHARGING
    TRANSIENT
    SELFFACTORY
    NOCLIP
    INVISIBLE
    BUMPER
    TELEPORTER
    DEACTIVATES
    TELESPAWN
    NOCLIP_ALLY
    INTLINES
    ONEUSE
    NORECOLOR
    NOPALETTE
    LAUNCHER_BARRAGE
    ALWAYSFIRE
    PALETTE
    NEVERFIRE
    STICKY
    ACTIVATE
    FIN
    ROTATOR
    NOICON
end

@bitflag ExplosiveFlags::Int32 begin
    ENABLED
    PROXIMITY
    FINAL
    FRAG_PROXIMITY
    FRAG_FINAL
    FRAG_IMPACT
    FRAG_NOFLASH
    FRIENDLY_FIRE
end


abstract type AbstractReassemblyShipOrFleet end
abstract type AbstractReassemblyShip <: AbstractReassemblyShipOrFleet end
abstract type AbstractReassemblyFleet <: AbstractReassemblyShipOrFleet end

abstract type AbstractReassemblyBlock{T} end
# abstract type AbstractLaunchable <: AbstractReassemblyBlock end

struct ShipData{WG<:StaticVector{4,Int}}
    name::String
    author::String
    wgroup::WG
end

mutable struct Block{T<:Real,T2<:StaticVector{2,T},F<:Integer,Shapetype,Boosttype,shroud,shroudvector <: AbstractVector{shroud}}
    group::F
    shape::Shapetype
    scale::UInt8
    name::String
    points::Int
    durability::T
    armor::T
    density::T
    blurb::String
    powerCapacity::T
    thrusterForce::T
    thrusterBoost::T
    thrusterBoostTime::T
    torquerTorque::T
    boost::Boosttype
    replicateTime::T
    turretSpeed::T
    turretLimit::T
    rotatorSpeed::T
    replicateTime::T
    turretSpeed::T
    turretLimit::T
    rotatorSpeed::T
    rotatorLimit::T
    generatorCapacityPerSec::T
    explodeDamage::T
    explodeRadius::T
    explodeStdDev::T
    deathFeatures::BlockFeatures
    launchSpeed::T
    launcherPower::T
    launcherSpeed::T
    launcherOutSpeed::T
    launcherAngVel::T
    tractorRange::T
    photosynthPerSec::T
    seedLifetime::T
    chargeMaxTime::T
    chargeMin::T
    teleporterRadius::T
    activatePower::T
    meleeDamage::T
    sort::Int
    barrelSize::T2
    barrelOffset::T2
    barrelSpacing::T2
    barrelCount::UInt8
    explosive::ExplosiveFlags
    barrelTaper::T
    elasticity::T
    sound::String
    aihint_range::T
    aihint_muzzleVel::T
    aihint_dps::T
    finForce::T
    shroud::shroudvector
end

export ReassemblyShip
struct ReassemblyShip{T<:Real,
                      block<:AbstractReassemblyBlock{T},
                      P<:StaticVector{2, T},
                      SD<:ShipData,
                      BT<:AbstractVector{block}} <: AbstractReassemblyShip
    position::P
    data::SD
    blocks::BT
end




end # module ReassemblyShips

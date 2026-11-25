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

mutable struct Block{ID<:Integer,
                     F<:Integer,
                     Shapetype,
                     Boosttype,
                     shroud,
                     shroudvector <: AbstractVector{shroud},
                     CMD,
                     replicatetype<:Block
                     Tcannon,
                     Tlaser,
                     Tshield}
    ident::ID
    offset::SVector{2,Float32}
    angle::Float32
    command::CMD
    persistentIdent::UInt
    bindingId::UInt8

    lifetime::Float32
    features::BlockFeatures
    growFrac::Float32
    health::Float32
    capacity::Float32
    explodeFaction::F
    growFeatures::BlockFeatures
    launchFeatures::BlockFeatures
    launchLifetime::Float32
    launchResources::Float32
    growRate::Float32
    fillColor::UInt
    fillColor1::UInt
    lineColor::UInt
    thrusterColor::UInt
    thrusterColor1::UInt
    replicateBlock::replicatetype
    cannon::Tcannon
    laser::Tlaser
    shield::Tshield

    group::F
    shape::Shapetype
    scale::UInt8
    name::String
    points::Int
    durability::Float32
    armor::Float32
    density::Float32
    blurb::String
    powerCapacity::Float32
    thrusterForce::Float32
    thrusterBoost::Float32
    thrusterBoostTime::Float32
    torquerTorque::Float32
    boost::Boosttype
    replicateTime::Float32
    turretSpeed::Float32
    turretLimit::Float32
    rotatorSpeed::Float32
    replicateTime::Float32
    turretSpeed::Float32
    turretLimit::Float32
    rotatorSpeed::Float32
    rotatorLimit::Float32
    generatorCapacityPerSec::Float32
    explodeDamage::Float32
    explodeRadius::Float32
    explodeStdDev::Float32
    deathFeatures::BlockFeatures
    launchSpeed::Float32
    launcherPower::Float32
    launcherSpeed::Float32
    launcherOutSpeed::Float32
    launcherAngVel::Float32
    tractorRange::Float32
    photosynthPerSec::Float32
    seedLifetime::Float32
    chargeMaxTime::Float32
    chargeMin::Float32
    teleporterRadius::Float32
    activatePower::Float32
    meleeDamage::Float32
    sort::Int
    barrelSize::SVector{2,Float32}
    barrelOffset::SVector{2,Float32}
    barrelSpacing::SVector{2,Float32}
    barrelCount::UInt8
    explosive::ExplosiveFlags
    barrelTaper::Float32
    elasticity::Float32
    sound::String
    aihint_range::Float32
    aihint_muzzleVel::Float32
    aihint_dps::Float32
    finForce::Float32
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

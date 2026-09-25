"""
    DataSource

Records data provenance for a component's field values: which organization or dataset the data came from, the URL it was retrieved from, and when it was retrieved. Mirrors the `DataSource` supplemental attribute from the upstream data layer, with two deliberate divergences: `organization` is optional here although it is required upstream, and `extra` is narrowed from an any-valued map to a string-valued one. Linked to the entity it describes through Core/Associations/SupplementalAttributeAssociation.json with attribute_type: "DataSource".

  - `organization`: Publishing organization, e.g. 'U.S. Energy Information Administration'.
  - `retrieved_at`: When the data was obtained.
  - `dataset`: Dataset identifier within the publishing organization, e.g. 'EIA-860 2023, Schedule 3'.
  - `url`: URL the data was retrieved from.
  - `version`: Data version or vintage, e.g. '2023 final'.
  - `published_at`: When the source published the data; null if unknown.
  - `confidence`: Confidence qualifier, e.g. 'high', 'medium'.
  - `recorded_by`: User or agent that recorded the value.
  - `fields`: Names of the component fields this provenance record applies to.
  - `extra`: Additional string-valued provenance metadata.
"""
Base.@kwdef struct DataSource <: APIModel
    id::Int64
    organization::Union{Absent, Nothing, String} = ABSENT
    retrieved_at::Dates.DateTime
    dataset::Union{Absent, Nothing, String} = ABSENT
    url::Union{Absent, Nothing, String} = ABSENT
    version::Union{Absent, Nothing, String} = ABSENT
    published_at::Union{Absent, Union{Dates.DateTime, Nothing}} = ABSENT
    confidence::Union{Absent, Nothing, String} = ABSENT
    recorded_by::Union{Absent, Union{Nothing, String}} = ABSENT
    fields::Vector{String}
    extra::Union{Absent, DataSourceExtra, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{DataSource}, value) = _decode(DataSource, value, true)
function _decode(::Type{DataSource}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-84b51e521c3e86885d35.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding DataSource";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "DataSource")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "DataSource"), false)
    _openapi_field_organization =
        haskey(_openapi_object, "organization") ?
        _decode(Union{Absent, Nothing, String}, _openapi_object["organization"], false) :
        ABSENT
    _openapi_field_retrieved_at = _decode(
        Dates.DateTime,
        _required(_openapi_object, "retrieved_at", "DataSource"),
        false,
    )
    _openapi_field_dataset =
        haskey(_openapi_object, "dataset") ?
        _decode(Union{Absent, Nothing, String}, _openapi_object["dataset"], false) : ABSENT
    _openapi_field_url =
        haskey(_openapi_object, "url") ?
        _decode(Union{Absent, Nothing, String}, _openapi_object["url"], false) : ABSENT
    _openapi_field_version =
        haskey(_openapi_object, "version") ?
        _decode(Union{Absent, Nothing, String}, _openapi_object["version"], false) : ABSENT
    _openapi_field_published_at =
        haskey(_openapi_object, "published_at") ?
        _decode(
            Union{Absent, Union{Dates.DateTime, Nothing}},
            _openapi_object["published_at"],
            false,
        ) : ABSENT
    _openapi_field_confidence =
        haskey(_openapi_object, "confidence") ?
        _decode(Union{Absent, Nothing, String}, _openapi_object["confidence"], false) :
        ABSENT
    _openapi_field_recorded_by =
        haskey(_openapi_object, "recorded_by") ?
        _decode(
            Union{Absent, Union{Nothing, String}},
            _openapi_object["recorded_by"],
            false,
        ) : ABSENT
    _openapi_field_fields =
        _decode(Vector{String}, _required(_openapi_object, "fields", "DataSource"), false)
    _openapi_field_extra =
        haskey(_openapi_object, "extra") ?
        _decode(Union{Absent, DataSourceExtra, Nothing}, _openapi_object["extra"], false) :
        ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "organization",
            "retrieved_at",
            "dataset",
            "url",
            "version",
            "published_at",
            "confidence",
            "recorded_by",
            "fields",
            "extra",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return DataSource(;
        id=_openapi_field_id,
        organization=_openapi_field_organization,
        retrieved_at=_openapi_field_retrieved_at,
        dataset=_openapi_field_dataset,
        url=_openapi_field_url,
        version=_openapi_field_version,
        published_at=_openapi_field_published_at,
        confidence=_openapi_field_confidence,
        recorded_by=_openapi_field_recorded_by,
        fields=_openapi_field_fields,
        extra=_openapi_field_extra,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::DataSource)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.organization isa Absent ||
        (_openapi_output["organization"] = _encode_unvalidated(_openapi_value.organization))
    _openapi_value.retrieved_at isa Absent ||
        (_openapi_output["retrieved_at"] = _encode_unvalidated(_openapi_value.retrieved_at))
    _openapi_value.dataset isa Absent ||
        (_openapi_output["dataset"] = _encode_unvalidated(_openapi_value.dataset))
    _openapi_value.url isa Absent ||
        (_openapi_output["url"] = _encode_unvalidated(_openapi_value.url))
    _openapi_value.version isa Absent ||
        (_openapi_output["version"] = _encode_unvalidated(_openapi_value.version))
    _openapi_value.published_at isa Absent ||
        (_openapi_output["published_at"] = _encode_unvalidated(_openapi_value.published_at))
    _openapi_value.confidence isa Absent ||
        (_openapi_output["confidence"] = _encode_unvalidated(_openapi_value.confidence))
    _openapi_value.recorded_by isa Absent ||
        (_openapi_output["recorded_by"] = _encode_unvalidated(_openapi_value.recorded_by))
    _openapi_value.fields isa Absent ||
        (_openapi_output["fields"] = _encode_unvalidated(_openapi_value.fields))
    _openapi_value.extra isa Absent ||
        (_openapi_output["extra"] = _encode_unvalidated(_openapi_value.extra))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode_unvalidated(_openapi_item)
    end
    return _openapi_output
end
_encode(_openapi_value::DataSource) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-84b51e521c3e86885d35.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding DataSource";
    direction=:neutral,
)

function _form_fields(_openapi_value::DataSource)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.organization isa Absent ||
        push!(_openapi_output, "organization" => _openapi_value.organization)
    _openapi_value.retrieved_at isa Absent ||
        push!(_openapi_output, "retrieved_at" => _openapi_value.retrieved_at)
    _openapi_value.dataset isa Absent ||
        push!(_openapi_output, "dataset" => _openapi_value.dataset)
    _openapi_value.url isa Absent || push!(_openapi_output, "url" => _openapi_value.url)
    _openapi_value.version isa Absent ||
        push!(_openapi_output, "version" => _openapi_value.version)
    _openapi_value.published_at isa Absent ||
        push!(_openapi_output, "published_at" => _openapi_value.published_at)
    _openapi_value.confidence isa Absent ||
        push!(_openapi_output, "confidence" => _openapi_value.confidence)
    _openapi_value.recorded_by isa Absent ||
        push!(_openapi_output, "recorded_by" => _openapi_value.recorded_by)
    _openapi_value.fields isa Absent ||
        push!(_openapi_output, "fields" => _openapi_value.fields)
    _openapi_value.extra isa Absent ||
        push!(_openapi_output, "extra" => _openapi_value.extra)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end

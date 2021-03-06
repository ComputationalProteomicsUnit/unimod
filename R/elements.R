#' Parse <elem> tag.
#' @param xml xml_document (returned by .unimodDb)
#' @return data.frame
#' @noRd
.elements <- function(xml) {
    stopifnot(requireNamespace("xml2"))
    elem <- xml2::xml_find_all(xml, "//umod:elements/umod:elem")
    m <- do.call(rbind, xml2::xml_attrs(elem))
    data.frame(
        Name=m[, "title"],
        FullName=m[, "full_name"],
        AvgMass=as.double(m[, "avge_mass"]),
        MonoMass=as.double(m[, "mono_mass"]),
        row.names=m[, "title"],
        stringsAsFactors=FALSE
    )
}

## TODO: save data.frame elements as public available data set `data(elements)`

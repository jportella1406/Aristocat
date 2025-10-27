/**
 *
 * @author Starlord
 */
package Config;

import java.sql.Timestamp;
import java.time.LocalDate;

public class Utils {

    public static String formatoDate(Timestamp fechaParametro) {
        Timestamp fechaNac = fechaParametro;
        String formattedDate = new java.text.SimpleDateFormat("yyyy-MM-dd").format(fechaNac);
        return formattedDate;
    }

    public static LocalDate fechaActual() {
        LocalDate fechaActualObtenida = LocalDate.now();
        return fechaActualObtenida;
    }

    public static Timestamp ConverisonFecha(String fecha) {
        if (fecha == null || fecha.isEmpty()) {
            return null;
        }

        String fechaString = fecha.replace("T", " ");

        if (fechaString.length() == 16) {
            fechaString += ":00";
        }

        try {
            return Timestamp.valueOf(fechaString);
        } catch (IllegalArgumentException e) {
            System.err.println("Error al convertir la fecha: " + fechaString+ " Exception: "+e);
            return null;
        }
    }
    
    public static Timestamp ConverisonFecha2(String fecha) {
    if (fecha == null || fecha.isEmpty()) {
        return null;
    }

    // Reemplazar 'T' por espacio si la fecha contiene 'T' (formato ISO 8601)
    String fechaString = fecha.replace("T", " ");

    // Verificar si la fecha tiene solo año, mes y día
    if (fechaString.length() == 10) {
        // Si solo tiene fecha (yyyy-mm-dd), agregamos la hora por defecto (00:00:00)
        fechaString += " 00:00:00";
    } else if (fechaString.length() == 16) {
        // Si tiene fecha y hora (yyyy-mm-dd HH:mm), agregamos los segundos
        fechaString += ":00";
    }

    try {
        // Intentar convertir a Timestamp
        return Timestamp.valueOf(fechaString);
    } catch (IllegalArgumentException e) {
        // Si hay un error en la conversión, lo imprimimos y devolvemos null
        System.err.println("Error al convertir la fecha: " + fechaString + " Exception: " + e);
        return null;
    }
}

}

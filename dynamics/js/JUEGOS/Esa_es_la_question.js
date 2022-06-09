window.addEventListener("load", ()=>{
    const user_id = document.getElementById("userH_id");
    const name = document.getElementById("userH_name");
    const apodo = document.getElementById("userH_apodo");
    const num_tipo_user = document.getElementById("userH_idTU");
    const string_tipo_user = document.getElementById("userH_tipo");
    const grado = document.getElementById("userH_grado");

    const clase = document.getElementById("clase");
    const privado = document.getElementById("privado");
    const crear = document.getElementById("crear");
    const start_a_e = document.getElementById("start_asignacion_e");
    const regresar_aA = document.getElementById("regresar_aA");
    const elegir_asignacion = document.getElementById("elegir_asignacion");


    clase.addEventListener("click", ()=>{
        console.log(string_tipo_user.value);
        if(string_tipo_user.value == "Docente")
        {
            menu.style.display = "none";
            crear.style.display = "grid";
            start_a_e.style.display = "none";
            elegir_asignacion.style.display = "none";
        }
        else if(string_tipo_user.value == "Alumno")
        {
            menu.style.display = "none";
            crear.style.display = "none";
            start_a_e.style.display = "none";
            elegir_asignacion.style.display = "flex";
            // menu.style.display = "none";
            // crear.style.display = "none";
            // start_a_e.style.display = "grid";
            // elegir_asignacion.style.display = "none";
            regresar_aA.addEventListener("click", ()=>{
                menu.style.display = "grid";
                crear.style.display = "none";
                start_a_e.style.display = "none";
                elegir_asignacion.style.display = "none";
            });
        }
    });
});
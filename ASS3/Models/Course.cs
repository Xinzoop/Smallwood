//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ASS3.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    
    public partial class Course
    {
        public Course()
        {
            this.Students = new HashSet<Student>();
        }
    
        public int Id { get; set; }
        [DisplayName("Course Code")]
        [Required]
        [RegularExpression(@"^\d{4}$", ErrorMessage="Invalid code (4 digits)")]
        public string Code { get; set; }
        [DisplayName("Course Name")]
        [Required]
        [RegularExpression(@"^.{1,128}$", ErrorMessage = "Invalid name (at most 128 length)")]
        public string Name { get; set; }
        [DisplayName("Faculty")]
        [Required]
        [RegularExpression(@"^.{1,128}$", ErrorMessage = "Invalid faculty (at most 128 length)")]
        public string Faculty { get; set; }
        [DisplayName("Years")]
        [Required]
        [Range(1, 8)]
        public int Years { get; set; }
    
        public virtual ICollection<Student> Students { get; set; }
    }
}

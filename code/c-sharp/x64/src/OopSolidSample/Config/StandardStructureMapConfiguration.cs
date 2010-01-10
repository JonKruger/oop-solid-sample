using System;
using System.Collections.Generic;
using System.Reflection;
using StructureMap;

namespace OopSolidSample.Config
{
    /// <summary>
    /// Configures StructureMap.
    /// 
    /// Call this class from the Application_Start() method in your Global.asax.cs file.
    /// </summary>
    /// <example>
    /// var config = new StandardStructureMapConfiguration();
    /// config.Configure();
    /// </example>
    public class StandardStructureMapConfiguration
    {
        public void Configure()
        {
            ObjectFactory.Initialize(
                x =>
                    {
                        x.UseDefaultStructureMapConfigFile = false;
                        x.Scan(scan =>
                                   {
                                       scan.WithDefaultConventions();
                                       scan.TheCallingAssembly();
                                   });

                        // register other types here
                        // example: 
                        // x.ForRequestedType<ISomething>().TheDefaultIsConcreteType<SomeClass>();
                    });
        }
    }
}
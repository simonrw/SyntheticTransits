$doxydocs=
{
  classes => [
    {
      name => 'std::allocator',
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'T',
          definition_name => 'T'
        }
      ],
      all_members => [
        {
          name => 'elements',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'std::allocator'
        }
      ],
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'elements',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'STL member.'
                }
              ]
            },
            detailed => {},
            type => 'T'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'Application',
      includes => {
        local => 'no',
        name => 'Application.h'
      },
      all_members => [
        {
          name => 'Application',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Application'
        },
        {
          name => 'GenerateModel',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Application'
        },
        {
          name => 'getHDUData',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Application'
        },
        {
          name => 'getObject',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Application'
        },
        {
          name => 'go',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Application'
        },
        {
          name => 'mInfile',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Application'
        },
        {
          name => 'mNObjects',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Application'
        },
        {
          name => 'mObjectIndex',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Application'
        },
        {
          name => 'ObjectIndex',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Application'
        },
        {
          name => 'UpdateFile',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Application'
        }
      ],
      public_methods => {
        members => [
          {
            kind => 'function',
            name => 'Application',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Default constructor.'
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'text',
                  content => 'Garuntees the object index and number of object initialisation'
                }
              ]
            },
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'go',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'argc',
                type => 'int'
              },
              {
                declaration_name => 'argv',
                type => 'char *',
                array => '[]'
              }
            ]
          }
        ]
      },
      private_methods => {
        members => [
          {
            kind => 'function',
            name => 'GenerateModel',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'Lightcurve',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'xmlfilename',
                type => 'const std::string &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'ObjectIndex',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'objName',
                type => 'const std::string &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'getHDUData',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'std::valarray< double >',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'hduname',
                type => 'const std::string &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'getObject',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'Lightcurve',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'UpdateFile',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'lc',
                type => 'const Lightcurve &'
              }
            ]
          }
        ]
      },
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'mInfile',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'CCfits::FITS object auto_ptr for RAII.'
                }
              ]
            },
            detailed => {},
            type => 'std::auto_ptr< CCfits::FITS >'
          },
          {
            kind => 'variable',
            name => 'mObjectIndex',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Selected object index.'
                }
              ]
            },
            detailed => {},
            type => 'int'
          },
          {
            kind => 'variable',
            name => 'mNObjects',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Number of total objects in the data set.'
                }
              ]
            },
            detailed => {},
            type => 'long'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'Main class for the program.'
          }
        ]
      },
      detailed => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'The class that handles the file io and storing the data in a useful way.'
          }
        ]
      }
    },
    {
      name => 'std::auto_ptr',
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'T',
          definition_name => 'T'
        }
      ],
      all_members => [
        {
          name => 'ptr',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'std::auto_ptr'
        }
      ],
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'ptr',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'STL member.'
                }
              ]
            },
            detailed => {},
            type => 'T'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::bad_alloc',
      base => [
        {
          name => 'std::exception',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::bad_cast',
      base => [
        {
          name => 'std::exception',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::bad_exception',
      base => [
        {
          name => 'std::exception',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::bad_typeid',
      base => [
        {
          name => 'std::exception',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'BaseException',
      base => [
        {
          name => 'std::exception',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      derived => [
        {
          name => 'MemoryException',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'ObjectNotFound',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'XMLException',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      includes => {
        local => 'no',
        name => 'Exceptions.h'
      },
      all_members => [
        {
          name => 'BaseException',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        },
        {
          name => 'str',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        },
        {
          name => 'what',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        },
        {
          name => '~BaseException',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        }
      ],
      public_methods => {
        members => [
          {
            kind => 'function',
            name => 'BaseException',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'val',
                type => 'const std::string &'
              }
            ]
          },
          {
            kind => 'function',
            name => '~BaseException',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            const => 'no',
            volatile => 'no',
            parameters => [
            ],
            exceptions => ' throw ()'
          },
          {
            kind => 'function',
            name => 'what',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'const char *',
            const => 'yes',
            volatile => 'no',
            parameters => [
            ],
            exceptions => ' throw ()'
          }
        ]
      },
      public_members => {
        members => [
          {
            kind => 'variable',
            name => 'str',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'std::string'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'Base exception.'
          }
        ]
      },
      detailed => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'All other exceptions inherit this exception for easy filtering of exceptions'
          },
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'Extra functionality: the object takes a std::string parameter for customising the error message and returns this string (as a C-string) in the '
          },
          {
            type => 'url',
            link => 'structBaseException_1a44505abd2e88ffaf5bb90e73452151b6',
            content => 'what()'
          },
          {
            type => 'text',
            content => ' method.'
          }
        ]
      }
    },
    {
      name => 'std::basic_fstream',
      base => [
        {
          name => 'std::basic_iostream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      derived => [
        {
          name => 'std::fstream',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::wfstream',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'Char',
          definition_name => 'Char'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::basic_ifstream',
      base => [
        {
          name => 'std::basic_istream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      derived => [
        {
          name => 'std::ifstream',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::wifstream',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'Char',
          definition_name => 'Char'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::basic_ios',
      base => [
        {
          name => 'std::ios_base',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      derived => [
        {
          name => 'std::basic_istream< char >',
          virtualness => 'virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_istream< wchar_t >',
          virtualness => 'virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_ostream< char >',
          virtualness => 'virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_ostream< wchar_t >',
          virtualness => 'virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_istream< Char >',
          virtualness => 'virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_ostream< Char >',
          virtualness => 'virtual',
          protection => 'public'
        },
        {
          name => 'std::ios',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::wios',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'Char',
          definition_name => 'Char'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::basic_iostream',
      base => [
        {
          name => 'std::basic_istream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_ostream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      derived => [
        {
          name => 'std::basic_fstream< char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_fstream< wchar_t >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_stringstream< char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_stringstream< wchar_t >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_fstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_stringstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'Char',
          definition_name => 'Char'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::basic_istream',
      base => [
        {
          name => 'std::basic_ios< Char >',
          virtualness => 'virtual',
          protection => 'public'
        }
      ],
      derived => [
        {
          name => 'std::basic_ifstream< char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_ifstream< wchar_t >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_iostream< char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_iostream< wchar_t >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_istringstream< char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_istringstream< wchar_t >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_ifstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_iostream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_istringstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::istream',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::wistream',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'Char',
          definition_name => 'Char'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::basic_istringstream',
      base => [
        {
          name => 'std::basic_istream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      derived => [
        {
          name => 'std::istringstream',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::wistringstream',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'Char',
          definition_name => 'Char'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::basic_ofstream',
      base => [
        {
          name => 'std::basic_ostream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      derived => [
        {
          name => 'std::ofstream',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::wofstream',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'Char',
          definition_name => 'Char'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::basic_ostream',
      base => [
        {
          name => 'std::basic_ios< Char >',
          virtualness => 'virtual',
          protection => 'public'
        }
      ],
      derived => [
        {
          name => 'std::basic_iostream< char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_iostream< wchar_t >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_ofstream< char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_ofstream< wchar_t >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_ostringstream< char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_ostringstream< wchar_t >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_iostream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_ofstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_ostringstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::ostream',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::wostream',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'Char',
          definition_name => 'Char'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::basic_ostringstream',
      base => [
        {
          name => 'std::basic_ostream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      derived => [
        {
          name => 'std::ostringstream',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::wostringstream',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'Char',
          definition_name => 'Char'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::basic_string',
      derived => [
        {
          name => 'std::string',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::wstring',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      inner => [
        {
          name => 'std::basic_string::const_iterator'
        },
        {
          name => 'std::basic_string::const_reverse_iterator'
        },
        {
          name => 'std::basic_string::iterator'
        },
        {
          name => 'std::basic_string::reverse_iterator'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'Char',
          definition_name => 'Char'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::basic_stringstream',
      base => [
        {
          name => 'std::basic_iostream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      derived => [
        {
          name => 'std::stringstream',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::wstringstream',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'Char',
          definition_name => 'Char'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::bitset',
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'Bits',
          definition_name => 'Bits'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::complex',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'Config::Config',
      includes => {
        local => 'no',
        name => 'XMLParserPugi.h'
      },
      all_members => [
        {
          name => 'coeffs',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'Config',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Config::Config'
        },
        {
          name => 'doc',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'dr',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'dt',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'getCoeffs',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Config::Config'
        },
        {
          name => 'getDR',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Config::Config'
        },
        {
          name => 'getDT',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Config::Config'
        },
        {
          name => 'getId',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Config::Config'
        },
        {
          name => 'getInclination',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Config::Config'
        },
        {
          name => 'getMaxTime',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Config::Config'
        },
        {
          name => 'getMidpoint',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Config::Config'
        },
        {
          name => 'getNoise',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Config::Config'
        },
        {
          name => 'getPeriod',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Config::Config'
        },
        {
          name => 'getPlanetRadius',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Config::Config'
        },
        {
          name => 'getSemi',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Config::Config'
        },
        {
          name => 'getStarRadius',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Config::Config'
        },
        {
          name => 'id',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'inclination',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'init',
          virtualness => 'non_virtual',
          protection => 'protected',
          scope => 'Config::Config'
        },
        {
          name => 'LoadFromFile',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Config::Config'
        },
        {
          name => 'LoadFromMemory',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Config::Config'
        },
        {
          name => 'm_getAll',
          virtualness => 'non_virtual',
          protection => 'protected',
          scope => 'Config::Config'
        },
        {
          name => 'm_getDR',
          virtualness => 'non_virtual',
          protection => 'protected',
          scope => 'Config::Config'
        },
        {
          name => 'm_getDT',
          virtualness => 'non_virtual',
          protection => 'protected',
          scope => 'Config::Config'
        },
        {
          name => 'm_getInclination',
          virtualness => 'non_virtual',
          protection => 'protected',
          scope => 'Config::Config'
        },
        {
          name => 'm_getLDCoeffs',
          virtualness => 'non_virtual',
          protection => 'protected',
          scope => 'Config::Config'
        },
        {
          name => 'm_getMaxTime',
          virtualness => 'non_virtual',
          protection => 'protected',
          scope => 'Config::Config'
        },
        {
          name => 'm_getMidpoint',
          virtualness => 'non_virtual',
          protection => 'protected',
          scope => 'Config::Config'
        },
        {
          name => 'm_getNoise',
          virtualness => 'non_virtual',
          protection => 'protected',
          scope => 'Config::Config'
        },
        {
          name => 'm_getPeriod',
          virtualness => 'non_virtual',
          protection => 'protected',
          scope => 'Config::Config'
        },
        {
          name => 'm_getPlanetRadius',
          virtualness => 'non_virtual',
          protection => 'protected',
          scope => 'Config::Config'
        },
        {
          name => 'm_getSemi',
          virtualness => 'non_virtual',
          protection => 'protected',
          scope => 'Config::Config'
        },
        {
          name => 'm_getStarRadius',
          virtualness => 'non_virtual',
          protection => 'protected',
          scope => 'Config::Config'
        },
        {
          name => 'maxtime',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'midpoint',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'noise',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'OrbitNode',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'period',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'PlanetNode',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'planetRadius',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'result',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'semi',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'SimulationNode',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'StarNode',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => 'starRadius',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Config::Config'
        },
        {
          name => '~Config',
          virtualness => 'virtual',
          protection => 'public',
          scope => 'Config::Config'
        }
      ],
      public_methods => {
        members => [
          {
            kind => 'function',
            name => 'Config',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => '~Config',
            virtualness => 'virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'virtual',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'LoadFromFile',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'filename',
                type => 'const string &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'LoadFromMemory',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'chars',
                type => 'const string &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'getCoeffs',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'vector< double > &',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getId',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getPlanetRadius',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getStarRadius',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getPeriod',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getSemi',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getInclination',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getMaxTime',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getDT',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getDR',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getMidpoint',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'getNoise',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          }
        ]
      },
      protected_methods => {
        members => [
          {
            kind => 'function',
            name => 'm_getPlanetRadius',
            virtualness => 'non_virtual',
            protection => 'protected',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'm_getStarRadius',
            virtualness => 'non_virtual',
            protection => 'protected',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'm_getLDCoeffs',
            virtualness => 'non_virtual',
            protection => 'protected',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'm_getPeriod',
            virtualness => 'non_virtual',
            protection => 'protected',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'm_getSemi',
            virtualness => 'non_virtual',
            protection => 'protected',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'm_getInclination',
            virtualness => 'non_virtual',
            protection => 'protected',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'm_getMaxTime',
            virtualness => 'non_virtual',
            protection => 'protected',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'm_getDT',
            virtualness => 'non_virtual',
            protection => 'protected',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'm_getDR',
            virtualness => 'non_virtual',
            protection => 'protected',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'm_getMidpoint',
            virtualness => 'non_virtual',
            protection => 'protected',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'm_getNoise',
            virtualness => 'non_virtual',
            protection => 'protected',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'm_getAll',
            virtualness => 'non_virtual',
            protection => 'protected',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Global data retrieval function.'
                }
              ]
            },
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'init',
            virtualness => 'non_virtual',
            protection => 'protected',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          }
        ]
      },
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'coeffs',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'vector< double >'
          },
          {
            kind => 'variable',
            name => 'id',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'int'
          },
          {
            kind => 'variable',
            name => 'planetRadius',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double'
          },
          {
            kind => 'variable',
            name => 'starRadius',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double'
          },
          {
            kind => 'variable',
            name => 'period',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double'
          },
          {
            kind => 'variable',
            name => 'semi',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double'
          },
          {
            kind => 'variable',
            name => 'inclination',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double'
          },
          {
            kind => 'variable',
            name => 'maxtime',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double'
          },
          {
            kind => 'variable',
            name => 'dt',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double'
          },
          {
            kind => 'variable',
            name => 'dr',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double'
          },
          {
            kind => 'variable',
            name => 'midpoint',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double'
          },
          {
            kind => 'variable',
            name => 'noise',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double'
          },
          {
            kind => 'variable',
            name => 'doc',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Document node.'
                }
              ]
            },
            detailed => {},
            type => 'pugi::xml_document'
          },
          {
            kind => 'variable',
            name => 'result',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Result of the xml parsing.'
                }
              ]
            },
            detailed => {},
            type => 'pugi::xml_parse_result'
          },
          {
            kind => 'variable',
            name => 'PlanetNode',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Planetary parameter node.'
                }
              ]
            },
            detailed => {},
            type => 'pugi::xml_node'
          },
          {
            kind => 'variable',
            name => 'StarNode',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Stellar parameter node.'
                }
              ]
            },
            detailed => {},
            type => 'pugi::xml_node'
          },
          {
            kind => 'variable',
            name => 'OrbitNode',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Orbital parameter node.'
                }
              ]
            },
            detailed => {},
            type => 'pugi::xml_node'
          },
          {
            kind => 'variable',
            name => 'SimulationNode',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Simulation information node.'
                }
              ]
            },
            detailed => {},
            type => 'pugi::xml_node'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'XML configuration file parser.'
          }
        ]
      },
      detailed => {
        doc => [
          {
            type => 'text',
            content => 'This file reads in the simulation configuration parameters in from the specified xml file and stores all the required variables in its own memory space for later access.'
          }
        ]
      }
    },
    {
      name => 'std::list::const_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::map::const_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::multimap::const_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::set::const_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::basic_string::const_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::multiset::const_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::string::const_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::vector::const_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::wstring::const_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::deque::const_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::list::const_reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::map::const_reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::multimap::const_reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::set::const_reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::basic_string::const_reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::multiset::const_reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::vector::const_reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::string::const_reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::wstring::const_reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::deque::const_reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::deque',
      inner => [
        {
          name => 'std::deque::const_iterator'
        },
        {
          name => 'std::deque::const_reverse_iterator'
        },
        {
          name => 'std::deque::iterator'
        },
        {
          name => 'std::deque::reverse_iterator'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'T',
          definition_name => 'T'
        }
      ],
      all_members => [
        {
          name => 'elements',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'std::deque'
        }
      ],
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'elements',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'STL member.'
                }
              ]
            },
            detailed => {},
            type => 'T'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::domain_error',
      base => [
        {
          name => 'std::logic_error',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::exception',
      derived => [
        {
          name => 'BaseException',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::bad_alloc',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::bad_cast',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::bad_exception',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::bad_typeid',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::ios_base::failure',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::logic_error',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::runtime_error',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::ios_base::failure',
      base => [
        {
          name => 'std::exception',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::fstream',
      base => [
        {
          name => 'std::basic_fstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::ifstream',
      base => [
        {
          name => 'std::basic_ifstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::invalid_argument',
      base => [
        {
          name => 'std::logic_error',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::ios',
      base => [
        {
          name => 'std::basic_ios< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::ios_base',
      derived => [
        {
          name => 'std::basic_ios< char >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_ios< wchar_t >',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::basic_ios< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      inner => [
        {
          name => 'std::ios_base::failure'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::istream',
      base => [
        {
          name => 'std::basic_istream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::istringstream',
      base => [
        {
          name => 'std::basic_istringstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::map::iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::vector::iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::multimap::iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::set::iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::list::iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::multiset::iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::basic_string::iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::string::iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::wstring::iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::deque::iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::length_error',
      base => [
        {
          name => 'std::logic_error',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'Lightcurve',
      includes => {
        local => 'no',
        name => 'Lightcurve.h'
      },
      all_members => [
        {
          name => 'asWASP',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Lightcurve'
        },
        {
          name => 'clear',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Lightcurve'
        },
        {
          name => 'epoch',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Lightcurve'
        },
        {
          name => 'flux',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Lightcurve'
        },
        {
          name => 'fluxerr',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Lightcurve'
        },
        {
          name => 'jd',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Lightcurve'
        },
        {
          name => 'Lightcurve',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Lightcurve'
        },
        {
          name => 'npts',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'Lightcurve'
        },
        {
          name => 'operator=',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Lightcurve'
        },
        {
          name => 'period',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Lightcurve'
        },
        {
          name => 'phase',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Lightcurve'
        },
        {
          name => 'size',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'Lightcurve'
        }
      ],
      public_methods => {
        members => [
          {
            kind => 'function',
            name => 'Lightcurve',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'text',
                  content => 'Constructor.'
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'text',
                  content => 'Sets the size of the input vectors to be of size n'
                }
              ]
            },
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'n',
                type => 'size_t'
              }
            ]
          },
          {
            kind => 'function',
            name => 'clear',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Manually clears the timeseries vectors.'
                }
              ]
            },
            detailed => {},
            type => 'void',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'size',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Returns the number of data points in the lightcurve.'
                }
              ]
            },
            detailed => {},
            type => 'size_t',
            const => 'yes',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'phase',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Returns a vector of the phase information.'
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Calculates the number of periods since the epoch, then takes the decimal part and creates the 0 point to be at the point of mid transit.'
                },
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'This phase information is not stored in the class itself.'
                }
              ]
            },
            type => 'std::vector< double >',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          },
          {
            kind => 'function',
            name => 'operator=',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Assignment constructor.'
                }
              ]
            },
            detailed => {},
            type => 'Lightcurve &',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'obj',
                type => 'const Lightcurve &'
              }
            ]
          }
        ]
      },
      public_members => {
        members => [
          {
            kind => 'variable',
            name => 'period',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Orbital period (days)'
                }
              ]
            },
            detailed => {},
            type => 'double'
          },
          {
            kind => 'variable',
            name => 'asWASP',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Treat the object as a WASP object Basically means the jd is actually wd.'
                }
              ]
            },
            detailed => {},
            type => 'bool'
          },
          {
            kind => 'variable',
            name => 'epoch',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Point of mid transit (days)'
                }
              ]
            },
            detailed => {},
            type => 'double'
          },
          {
            kind => 'variable',
            name => 'jd',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Time series for the time, flux and errors.'
                }
              ]
            },
            detailed => {},
            type => 'std::vector< double >'
          },
          {
            kind => 'variable',
            name => 'flux',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'std::vector< double >'
          },
          {
            kind => 'variable',
            name => 'fluxerr',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'std::vector< double >'
          }
        ]
      },
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'npts',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Number of data points in the lightcurve.'
                }
              ]
            },
            detailed => {},
            type => 'size_t'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'url',
            link => 'classLightcurve',
            content => 'Lightcurve'
          },
          {
            type => 'text',
            content => ' class which stores information about a single object.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::list',
      inner => [
        {
          name => 'std::list::const_iterator'
        },
        {
          name => 'std::list::const_reverse_iterator'
        },
        {
          name => 'std::list::iterator'
        },
        {
          name => 'std::list::reverse_iterator'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'T',
          definition_name => 'T'
        }
      ],
      all_members => [
        {
          name => 'elements',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'std::list'
        }
      ],
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'elements',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'STL member.'
                }
              ]
            },
            detailed => {},
            type => 'T'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::logic_error',
      base => [
        {
          name => 'std::exception',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      derived => [
        {
          name => 'std::domain_error',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::invalid_argument',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::length_error',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::out_of_range',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::map',
      inner => [
        {
          name => 'std::map::const_iterator'
        },
        {
          name => 'std::map::const_reverse_iterator'
        },
        {
          name => 'std::map::iterator'
        },
        {
          name => 'std::map::reverse_iterator'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'K',
          definition_name => 'K'
        },
        {
          type => 'typename',
          declaration_name => 'T',
          definition_name => 'T'
        }
      ],
      all_members => [
        {
          name => 'elements',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'std::map'
        },
        {
          name => 'keys',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'std::map'
        }
      ],
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'keys',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'STL member.'
                }
              ]
            },
            detailed => {},
            type => 'K'
          },
          {
            kind => 'variable',
            name => 'elements',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'STL member.'
                }
              ]
            },
            detailed => {},
            type => 'T'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'MemoryException',
      base => [
        {
          name => 'BaseException',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      includes => {
        local => 'no',
        name => 'Exceptions.h'
      },
      all_members => [
        {
          name => 'BaseException',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        },
        {
          name => 'MemoryException',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'MemoryException'
        },
        {
          name => 'str',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        },
        {
          name => 'what',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        },
        {
          name => '~BaseException',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        }
      ],
      public_methods => {
        members => [
          {
            kind => 'function',
            name => 'MemoryException',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'val',
                type => 'const std::string &'
              }
            ]
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'Memory exception if the user requires less than 0 or more than all of the memory.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::multimap',
      inner => [
        {
          name => 'std::multimap::const_iterator'
        },
        {
          name => 'std::multimap::const_reverse_iterator'
        },
        {
          name => 'std::multimap::iterator'
        },
        {
          name => 'std::multimap::reverse_iterator'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'K',
          definition_name => 'K'
        },
        {
          type => 'typename',
          declaration_name => 'T',
          definition_name => 'T'
        }
      ],
      all_members => [
        {
          name => 'elements',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'std::multimap'
        },
        {
          name => 'keys',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'std::multimap'
        }
      ],
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'keys',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'STL member.'
                }
              ]
            },
            detailed => {},
            type => 'K'
          },
          {
            kind => 'variable',
            name => 'elements',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'STL member.'
                }
              ]
            },
            detailed => {},
            type => 'T'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::multiset',
      inner => [
        {
          name => 'std::multiset::const_iterator'
        },
        {
          name => 'std::multiset::const_reverse_iterator'
        },
        {
          name => 'std::multiset::iterator'
        },
        {
          name => 'std::multiset::reverse_iterator'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'K',
          definition_name => 'K'
        }
      ],
      all_members => [
        {
          name => 'keys',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'std::multiset'
        }
      ],
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'keys',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'STL member.'
                }
              ]
            },
            detailed => {},
            type => 'K'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'ObjectNotFound',
      base => [
        {
          name => 'BaseException',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      includes => {
        local => 'no',
        name => 'Exceptions.h'
      },
      all_members => [
        {
          name => 'BaseException',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        },
        {
          name => 'ObjectNotFound',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'ObjectNotFound'
        },
        {
          name => 'str',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        },
        {
          name => 'what',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        },
        {
          name => '~BaseException',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        }
      ],
      public_methods => {
        members => [
          {
            kind => 'function',
            name => 'ObjectNotFound',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'val',
                type => 'const std::string &'
              }
            ]
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'Thrown if the selected object is not in the file.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::ofstream',
      base => [
        {
          name => 'std::basic_ofstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::ostream',
      base => [
        {
          name => 'std::basic_ostream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::ostringstream',
      base => [
        {
          name => 'std::basic_ostringstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::out_of_range',
      base => [
        {
          name => 'std::logic_error',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::overflow_error',
      base => [
        {
          name => 'std::runtime_error',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::priority_queue',
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'T',
          definition_name => 'T'
        }
      ],
      all_members => [
        {
          name => 'elements',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'std::priority_queue'
        }
      ],
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'elements',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'STL member.'
                }
              ]
            },
            detailed => {},
            type => 'T'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::queue',
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'T',
          definition_name => 'T'
        }
      ],
      all_members => [
        {
          name => 'elements',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'std::queue'
        }
      ],
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'elements',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'STL member.'
                }
              ]
            },
            detailed => {},
            type => 'T'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::range_error',
      base => [
        {
          name => 'std::runtime_error',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::map::reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::set::reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::string::reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::vector::reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::multiset::reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::basic_string::reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::multimap::reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::deque::reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::wstring::reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::list::reverse_iterator',
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL iterator class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::runtime_error',
      base => [
        {
          name => 'std::exception',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      derived => [
        {
          name => 'std::overflow_error',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::range_error',
          virtualness => 'non_virtual',
          protection => 'public'
        },
        {
          name => 'std::underflow_error',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::set',
      inner => [
        {
          name => 'std::set::const_iterator'
        },
        {
          name => 'std::set::const_reverse_iterator'
        },
        {
          name => 'std::set::iterator'
        },
        {
          name => 'std::set::reverse_iterator'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'K',
          definition_name => 'K'
        }
      ],
      all_members => [
        {
          name => 'keys',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'std::set'
        }
      ],
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'keys',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'STL member.'
                }
              ]
            },
            detailed => {},
            type => 'K'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::stack',
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'T',
          definition_name => 'T'
        }
      ],
      all_members => [
        {
          name => 'elements',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'std::stack'
        }
      ],
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'elements',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'STL member.'
                }
              ]
            },
            detailed => {},
            type => 'T'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::string',
      base => [
        {
          name => 'std::basic_string< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      inner => [
        {
          name => 'std::string::const_iterator'
        },
        {
          name => 'std::string::const_reverse_iterator'
        },
        {
          name => 'std::string::iterator'
        },
        {
          name => 'std::string::reverse_iterator'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::stringstream',
      base => [
        {
          name => 'std::basic_stringstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::underflow_error',
      base => [
        {
          name => 'std::runtime_error',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::valarray',
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'T',
          definition_name => 'T'
        }
      ],
      all_members => [
        {
          name => 'elements',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'std::valarray'
        }
      ],
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'elements',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'STL member.'
                }
              ]
            },
            detailed => {},
            type => 'T'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::vector',
      inner => [
        {
          name => 'std::vector::const_iterator'
        },
        {
          name => 'std::vector::const_reverse_iterator'
        },
        {
          name => 'std::vector::iterator'
        },
        {
          name => 'std::vector::reverse_iterator'
        }
      ],
      template_parameters => [
        {
          type => 'typename',
          declaration_name => 'T',
          definition_name => 'T'
        }
      ],
      all_members => [
        {
          name => 'elements',
          virtualness => 'non_virtual',
          protection => 'private',
          scope => 'std::vector'
        }
      ],
      private_members => {
        members => [
          {
            kind => 'variable',
            name => 'elements',
            virtualness => 'non_virtual',
            protection => 'private',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'STL member.'
                }
              ]
            },
            detailed => {},
            type => 'T'
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::wfstream',
      base => [
        {
          name => 'std::basic_fstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::wifstream',
      base => [
        {
          name => 'std::basic_ifstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::wios',
      base => [
        {
          name => 'std::basic_ios< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::wistream',
      base => [
        {
          name => 'std::basic_istream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::wistringstream',
      base => [
        {
          name => 'std::basic_istringstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::wofstream',
      base => [
        {
          name => 'std::basic_ofstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::wostream',
      base => [
        {
          name => 'std::basic_ostream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::wostringstream',
      base => [
        {
          name => 'std::basic_ostringstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::wstring',
      base => [
        {
          name => 'std::basic_string< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      inner => [
        {
          name => 'std::wstring::const_iterator'
        },
        {
          name => 'std::wstring::const_reverse_iterator'
        },
        {
          name => 'std::wstring::iterator'
        },
        {
          name => 'std::wstring::reverse_iterator'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'std::wstringstream',
      base => [
        {
          name => 'std::basic_stringstream< Char >',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      all_members => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'STL class.'
          }
        ]
      },
      detailed => {}
    },
    {
      name => 'XMLException',
      base => [
        {
          name => 'BaseException',
          virtualness => 'non_virtual',
          protection => 'public'
        }
      ],
      includes => {
        local => 'no',
        name => 'Exceptions.h'
      },
      all_members => [
        {
          name => 'BaseException',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        },
        {
          name => 'str',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        },
        {
          name => 'what',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        },
        {
          name => 'XMLException',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'XMLException'
        },
        {
          name => '~BaseException',
          virtualness => 'non_virtual',
          protection => 'public',
          scope => 'BaseException'
        }
      ],
      public_methods => {
        members => [
          {
            kind => 'function',
            name => 'XMLException',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'val',
                type => 'const std::string &'
              }
            ]
          }
        ]
      },
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'text',
            content => 'Custom xml exception if any xml handling goes wrong.'
          }
        ]
      },
      detailed => {}
    }
  ],
  namespaces => [
    {
      name => 'Config',
      classes => [
        {
          name => 'Config::Config'
        }
      ],
      namespaces => [
      ],
      brief => {
        doc => [
          {
            type => 'parbreak'
          },
          {
            type => 'url',
            link => 'namespaceConfig',
            content => 'Config'
          },
          {
            type => 'text',
            content => ' namespace to keep the configuration parser seperate.'
          }
        ]
      },
      detailed => {
        doc => [
          {
            type => 'text',
            content => 'Was originally introduced as there was another config file parser in place but it depended on Qt so when this new class was created, it was added to the '
          },
          {
            type => 'url',
            link => 'namespaceConfig',
            content => 'Config'
          },
          {
            type => 'text',
            content => ' namespace for separation'
          }
        ]
      }
    },
    {
      name => 'std',
      classes => [
        {
          name => 'std::allocator'
        },
        {
          name => 'std::auto_ptr'
        },
        {
          name => 'std::ios_base'
        },
        {
          name => 'std::basic_ios'
        },
        {
          name => 'std::basic_istream'
        },
        {
          name => 'std::basic_ostream'
        },
        {
          name => 'std::basic_iostream'
        },
        {
          name => 'std::basic_ifstream'
        },
        {
          name => 'std::basic_ofstream'
        },
        {
          name => 'std::basic_fstream'
        },
        {
          name => 'std::basic_istringstream'
        },
        {
          name => 'std::basic_ostringstream'
        },
        {
          name => 'std::basic_stringstream'
        },
        {
          name => 'std::ios'
        },
        {
          name => 'std::wios'
        },
        {
          name => 'std::istream'
        },
        {
          name => 'std::wistream'
        },
        {
          name => 'std::ostream'
        },
        {
          name => 'std::wostream'
        },
        {
          name => 'std::ifstream'
        },
        {
          name => 'std::wifstream'
        },
        {
          name => 'std::ofstream'
        },
        {
          name => 'std::wofstream'
        },
        {
          name => 'std::fstream'
        },
        {
          name => 'std::wfstream'
        },
        {
          name => 'std::istringstream'
        },
        {
          name => 'std::wistringstream'
        },
        {
          name => 'std::ostringstream'
        },
        {
          name => 'std::wostringstream'
        },
        {
          name => 'std::stringstream'
        },
        {
          name => 'std::wstringstream'
        },
        {
          name => 'std::basic_string'
        },
        {
          name => 'std::string'
        },
        {
          name => 'std::wstring'
        },
        {
          name => 'std::complex'
        },
        {
          name => 'std::bitset'
        },
        {
          name => 'std::deque'
        },
        {
          name => 'std::list'
        },
        {
          name => 'std::map'
        },
        {
          name => 'std::multimap'
        },
        {
          name => 'std::set'
        },
        {
          name => 'std::multiset'
        },
        {
          name => 'std::vector'
        },
        {
          name => 'std::queue'
        },
        {
          name => 'std::priority_queue'
        },
        {
          name => 'std::stack'
        },
        {
          name => 'std::valarray'
        },
        {
          name => 'std::exception'
        },
        {
          name => 'std::bad_alloc'
        },
        {
          name => 'std::bad_cast'
        },
        {
          name => 'std::bad_typeid'
        },
        {
          name => 'std::logic_error'
        },
        {
          name => 'std::runtime_error'
        },
        {
          name => 'std::bad_exception'
        },
        {
          name => 'std::domain_error'
        },
        {
          name => 'std::invalid_argument'
        },
        {
          name => 'std::length_error'
        },
        {
          name => 'std::out_of_range'
        },
        {
          name => 'std::range_error'
        },
        {
          name => 'std::overflow_error'
        },
        {
          name => 'std::underflow_error'
        }
      ],
      namespaces => [
      ],
      brief => {
        doc => [
          {
            type => 'text',
            content => 'STL namespace.'
          }
        ]
      },
      detailed => {}
    }
  ],
  files => [
    {
      name => 'AlterTransit.h',
      includes => [
        {
          name => 'Lightcurve.h',
          ref => 'Lightcurve_8h'
        }
      ],
      included_by => [
      ],
      functions => {
        members => [
          {
            kind => 'function',
            name => 'RemoveTransit',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'Lightcurve',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'data',
                type => 'Lightcurve &'
              },
              {
                declaration_name => 'model',
                type => 'Lightcurve &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'AddTransit',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'Lightcurve',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'data',
                type => 'Lightcurve &'
              },
              {
                declaration_name => 'model',
                type => 'Lightcurve &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'AlterTransit',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'Lightcurve',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'data',
                type => 'Lightcurve &'
              },
              {
                declaration_name => 'subModel',
                type => 'Lightcurve &'
              },
              {
                declaration_name => 'addModel',
                type => 'Lightcurve &'
              },
              {
                declaration_name => 'WASP',
                type => 'bool'
              },
              {
                declaration_name => 'addModelFlag',
                type => 'bool',
                default_value => 'true'
              }
            ]
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'Application.h',
      includes => [
        {
          name => 'CCfits/CCfits'
        },
        {
          name => 'Lightcurve.h',
          ref => 'Lightcurve_8h'
        }
      ],
      included_by => [
      ],
      brief => {},
      detailed => {}
    },
    {
      name => 'constants.h',
      includes => [
      ],
      included_by => [
        {
          name => 'include/WaspDateConverter.h',
          ref => 'WaspDateConverter_8h'
        }
      ],
      variables => {
        members => [
          {
            kind => 'variable',
            name => 'rJup',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'const double',
            initializer => ' 71492E3'
          },
          {
            kind => 'variable',
            name => 'rSun',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'const double',
            initializer => ' 6.995E8'
          },
          {
            kind => 'variable',
            name => 'AU',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'const double',
            initializer => ' 1.496E11'
          },
          {
            kind => 'variable',
            name => 'secondsInMinute',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'const double',
            initializer => ' 60.'
          },
          {
            kind => 'variable',
            name => 'secondsInHour',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'const double',
            initializer => ' 60. * secondsInMinute'
          },
          {
            kind => 'variable',
            name => 'secondsInDay',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'const double',
            initializer => ' 24. * secondsInHour'
          },
          {
            kind => 'variable',
            name => 'radiansInDegree',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'const double',
            initializer => ' 2. * 3.14 / 360.'
          },
          {
            kind => 'variable',
            name => 'degreesInRadian',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'const double',
            initializer => ' 360. / 2. / 3.14'
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'Exceptions.h',
      includes => [
        {
          name => 'exception'
        },
        {
          name => 'string'
        }
      ],
      included_by => [
      ],
      brief => {},
      detailed => {}
    },
    {
      name => 'FuncIntensity.h',
      includes => [
        {
          name => 'vector'
        }
      ],
      included_by => [
      ],
      functions => {
        members => [
          {
            kind => 'function',
            name => 'I',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'r',
                type => 'double'
              },
              {
                declaration_name => 'c1',
                type => 'double'
              },
              {
                declaration_name => 'c2',
                type => 'double'
              },
              {
                declaration_name => 'c3',
                type => 'double'
              },
              {
                declaration_name => 'c4',
                type => 'double'
              }
            ]
          },
          {
            kind => 'function',
            name => 'I',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'r',
                type => 'double'
              },
              {
                declaration_name => 'coeffs',
                type => 'const std::vector< double > &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'IntegratedI',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'dr',
                type => 'double'
              },
              {
                declaration_name => 'c1',
                type => 'double'
              },
              {
                declaration_name => 'c2',
                type => 'double'
              },
              {
                declaration_name => 'c3',
                type => 'double'
              },
              {
                declaration_name => 'c4',
                type => 'double'
              },
              {
                declaration_name => 'rlow',
                type => 'double'
              },
              {
                declaration_name => 'rhigh',
                type => 'double'
              }
            ]
          },
          {
            kind => 'function',
            name => 'IntegratedI',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'dr',
                type => 'double'
              },
              {
                declaration_name => 'coeffs',
                type => 'const std::vector< double > &'
              },
              {
                declaration_name => 'rlow',
                type => 'double'
              },
              {
                declaration_name => 'rhigh',
                type => 'double'
              }
            ]
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'FuncOmega.h',
      includes => [
        {
          name => 'vector'
        }
      ],
      included_by => [
      ],
      functions => {
        members => [
          {
            kind => 'function',
            name => 'calcOmega',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'coeffs',
                type => 'const std::vector< double > &'
              }
            ]
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'FuncSquare.h',
      includes => [
      ],
      included_by => [
      ],
      functions => {
        members => [
          {
            kind => 'function',
            name => 'square',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'T',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'val',
                type => 'T'
              }
            ]
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'GetSystemMemory.h',
      includes => [
      ],
      included_by => [
      ],
      functions => {
        members => [
          {
            kind => 'function',
            name => 'getTotalSystemMemory',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {
              doc => [
                {
                  type => 'parbreak'
                },
                {
                  type => 'text',
                  content => 'Returns the system memory.'
                }
              ]
            },
            detailed => {
              doc => [
                {
                  type => 'text',
                  content => 'Runs platform independant (on apple and linux anyway) method of getting the system memory (RAM) in bytes'
                }
              ]
            },
            type => 'long',
            const => 'no',
            volatile => 'no',
            parameters => [
            ]
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'Lightcurve.h',
      includes => [
        {
          name => 'vector'
        }
      ],
      included_by => [
        {
          name => 'include/AlterTransit.h',
          ref => 'AlterTransit_8h'
        },
        {
          name => 'include/Application.h',
          ref => 'Application_8h'
        }
      ],
      brief => {},
      detailed => {}
    },
    {
      name => 'SortedIndex.h',
      includes => [
        {
          name => 'algorithm'
        },
        {
          name => 'nr/nr3.h'
        },
        {
          name => 'nr/interp_1d.h'
        },
        {
          name => 'nr/interp_linear.h'
        }
      ],
      included_by => [
      ],
      defines => {
        members => [
          {
            kind => 'define',
            name => '_USESTDVECTOR_',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {}
          }
        ]
      },
      functions => {
        members => [
          {
            kind => 'function',
            name => 'PairComparitor',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'bool',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'val1',
                type => 'const pair< double, int > &'
              },
              {
                declaration_name => 'val2',
                type => 'const pair< double, int > &'
              }
            ]
          },
          {
            kind => 'function',
            name => 'SortedIndex',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'std::vector< std::pair< double, int > >',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'data',
                type => 'const std::vector< T > &'
              }
            ]
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'ToStringList.h',
      includes => [
        {
          name => 'vector'
        },
        {
          name => 'string'
        },
        {
          name => 'sstream'
        },
        {
          name => 'CCfits/CCfits'
        }
      ],
      included_by => [
      ],
      functions => {
        members => [
          {
            kind => 'function',
            name => 'ToStringList',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'std::vector< std::string >',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'col',
                type => 'CCfits::Column &'
              },
              {
                declaration_name => 'size',
                type => 'int'
              }
            ]
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'WaspDateConverter.h',
      includes => [
        {
          name => 'constants.h',
          ref => 'constants_8h'
        }
      ],
      included_by => [
      ],
      functions => {
        members => [
          {
            kind => 'function',
            name => 'wd2jd',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'wd',
                type => 'T'
              }
            ]
          },
          {
            kind => 'function',
            name => 'jd2wd',
            virtualness => 'non_virtual',
            protection => 'public',
            static => 'no',
            brief => {},
            detailed => {},
            type => 'double',
            const => 'no',
            volatile => 'no',
            parameters => [
              {
                declaration_name => 'jd',
                type => 'T'
              }
            ]
          }
        ]
      },
      brief => {},
      detailed => {}
    },
    {
      name => 'XMLParserPugi.h',
      includes => [
        {
          name => 'pugixml.hpp'
        },
        {
          name => 'vector'
        },
        {
          name => 'string'
        }
      ],
      included_by => [
      ],
      brief => {},
      detailed => {}
    }
  ],
  groups => [
  ],
  pages => [
    {
      name => 'todo',
      title => 'Todo List',
      detailed => {
        doc => [
          {
            type => 'anchor',
            id => 'todo_1_todo000001'
          },
          {
            type => 'text',
            content => ' page '
          },
          {
            type => 'ref',
            link => 'index',
            content => [
              {
                type => 'text',
                content => 'Main Page'
              }
            ]
          },
          {
            type => 'text',
            content => ' Package all external requirements in another directory'
          }
        ]
      }
    },
    {
      name => 'index',
      detailed => {
        doc => [
          {
            type => 'sect1',
            content => [
              {
                type => 'text',
                content => 'This software takes a Sysrem-compatible data file and alters the chosen lightcurve by removing an already present transit and adding a custom synthetic transit in.'
              }
            ]
          },
          {
            type => 'sect1',
            content => [
              {
                type => 'text',
                content => 'WASP-12b is an extremely large exoplanet, almost larger than thought possible. Due to it\'s large size, it is fairly visible as the transit depth depends on the ratio of stellar and planetary radii'
              },
              {
                type => 'parbreak'
              },
              {
                type => 'formula',
                id => '',
                content => '\\[ \\delta = \\frac{r_p^2}{r_s^2} \\]'
              },
              {
                type => 'parbreak'
              },
              {
                type => 'text',
                content => 'What if WASP-12b was slightly smaller? Perhaps this would not have been detected by SuperWASP. By generating synthetic WASP-12b lightcurves with differing radii the sensitivity to the planetary radius can be mapped out. If other parameters are considered also then this could lead to an understanding of the selection biases towards certain kinds of planet in the SuperWASP survey and a possible understanding of the underlying population.'
              }
            ]
          },
          {
            type => 'sect1',
            content => [
              {
                type => 'text',
                content => 'First the data file is opened and scanned for the given object. If no object with the specified name is found then an exception is thrown. The lightcurve is then read in to memory.'
              },
              {
                type => 'parbreak'
              },
              {
                type => 'text',
                content => 'Two synthetic lightcurves are generated with the parameters given on the command line using the Mandel & Agol model with non-linear limb darkening.'
              },
              {
                type => 'parbreak'
              },
              {
                type => 'text',
                content => 'Firstly the subtracted model is phase folded on the period and epoch values supplied, and a linear interpolator object is generated with this data. A model lightcurve is then interpolated on to the data\'s time grid, the data normalised to its own mean and the interpolated model is subtracted.'
              },
              {
                type => 'parbreak'
              },
              {
                type => 'text',
                content => 'Then the model lightcurve is added in a similar process.'
              }
            ]
          },
          {
            type => 'sect1',
            content => [
              {
                type => 'text',
                content => 'All the code is written in C++ so a working compiler must be available.'
              },
              {
                type => 'parbreak'
              },
              {
                type => 'text',
                content => 'For compilation on another system, certain libraries must also be installed. These include: '
              },
              {
                type => 'list',
                style => 'itemized',
                content => [
                  [
                    {
                      type => 'text',
                      content => 'CMake (for the build system) '
                    }
                  ],
                  [
                    {
                      type => 'text',
                      content => 'CCfits '
                    }
                  ],
                  [
                    {
                      type => 'text',
                      content => 'pugixml '
                    }
                  ],
                  [
                    {
                      type => 'text',
                      content => 'tclap '
                    }
                  ],
                  [
                    {
                      type => 'text',
                      content => 'Numerical recipes 3'
                    }
                  ]
                ]
              }
            ]
          },
          {
            type => 'sect1',
            content => [
              {
                type => 'xrefitem',
                content => [
                  {
                    type => 'text',
                    content => 'Package all external requirements in another directory'
                  }
                ]
              }
            ]
          }
        ]
      }
    }
  ]
};
1;
